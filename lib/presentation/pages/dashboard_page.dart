import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_hailing/logic/provider/member_store.dart';
import 'package:ride_hailing/domain/members/member.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MemberStore>().init();
    });
  }

  Future<void> _onRefresh() async {
    await context.read<MemberStore>().fetchMembers();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<MemberStore>();

    Widget body;
    if (store.loading && store.members.isEmpty) {
      body = const Center(child: CircularProgressIndicator());
    } else if (store.error != null && store.members.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Failed to load members'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => store.fetchMembers(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else {
      body = RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: store.members.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final Member m = store.members[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(m.avatar),
                child: m.avatar.isEmpty ? Text(m.firstName.isNotEmpty ? m.firstName[0] : '?') : null,
              ),
              title: Text('${m.firstName} ${m.lastName}'),
              subtitle: Text('Age ${m.age} • ${m.status} • ${m.relationship}'),
              trailing: Switch(
                value: m.screenTimeEnabled,
                onChanged: (val) => store.toggle(m.id, val),
              ),
              onTap: () => Navigator.of(context).pushNamed(
                RouteGenerator.memberDetailPage,
                arguments: m,
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          if (store.syncing) const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(child: SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))),
          ),
        ],
      ),
      body: body,
    );
  }
}
