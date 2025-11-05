import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:ride_hailing/domain/members/member.dart';
import 'package:ride_hailing/services/member_service.dart';

class MemberStore with ChangeNotifier {
  final MemberService _service;
  bool loading = false;
  String? error;
  List<Member> members = [];
  bool syncing = false;

  static const String _membersBoxName = 'membersBox';
  static const String _toggleQueueBoxName = 'toggleQueueBox';

  MemberStore({MemberService? service}) : _service = service ?? MemberService();

  Future<void> _ensureBoxes() async {
    if (!Hive.isBoxOpen(_membersBoxName)) {
      await Hive.openBox(_membersBoxName);
    }
    if (!Hive.isBoxOpen(_toggleQueueBoxName)) {
      await Hive.openBox(_toggleQueueBoxName);
    }
  }

  Future<void> init() async {
    await _ensureBoxes();
    final box = Hive.box(_membersBoxName);
    final cached = box.get('members');
    if (cached is List) {
      members = cached
          .whereType<Map>()
          .map((e) => Member.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      notifyListeners();
    }
    await fetchMembers();
    await syncPending();
  }

  Future<void> fetchMembers() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      final data = await _service.fetchMembers();
      members = data;
      final box = Hive.box(_membersBoxName);
      await box.put(
        'members',
        members.map((m) => m.toJson()).toList(),
      );
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> toggle(String id, bool enabled) async {
    final idx = members.indexWhere((m) => m.id == id);
    if (idx >= 0) {
      members[idx] = members[idx].copyWith(screenTimeEnabled: enabled);
      notifyListeners();
    }
    try {
      final patched = await _service.patchMemberToggle(id, enabled);
      if (idx >= 0) {
        members[idx] = patched;
      }
      final box = Hive.box(_membersBoxName);
      await box.put('members', members.map((m) => m.toJson()).toList());
      notifyListeners();
    } catch (_) {
      final q = Hive.box(_toggleQueueBoxName);
      final list = List<Map<String, dynamic>>.from(q.get('queue') ?? []);
      list.add({'id': id, 'enabled': enabled, 'ts': DateTime.now().millisecondsSinceEpoch});
      await q.put('queue', list);
    }
  }

  Future<void> syncPending() async {
    await _ensureBoxes();
    final q = Hive.box(_toggleQueueBoxName);
    final List queue = List.from(q.get('queue') ?? []);
    if (queue.isEmpty) return;
    syncing = true;
    notifyListeners();
    final failed = <Map<String, dynamic>>[];
    for (final item in queue) {
      try {
        final id = item['id'].toString();
        final enabled = item['enabled'] == true;
        await _service.patchMemberToggle(id, enabled);
      } catch (_) {
        failed.add(Map<String, dynamic>.from(item));
      }
    }
    await q.put('queue', failed);
    syncing = false;
    notifyListeners();
  }
}
