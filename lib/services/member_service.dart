import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onehaven_flutter_challenge/domain/members/member.dart';

class MemberService {
  final Dio _dio;

  MemberService._(this._dio);

  factory MemberService() {
    final baseUrl = dotenv.env['MOCK_API_BASE_URL'] ?? 'http://10.0.2.2:3000';
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    return MemberService._(dio);
  }

  Future<List<Member>> fetchMembers() async {
    final res = await _dio.get('/members');
    final data = res.data as List<dynamic>;
    return data.map((e) => Member.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Member> fetchMember(String id) async {
    final res = await _dio.get('/members/$id');
    return Member.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Member> patchMemberToggle(String id, bool enabled) async {
    final res = await _dio.patch('/members/$id', data: {
      'screenTimeEnabled': enabled,
    });
    return Member.fromJson(res.data as Map<String, dynamic>);
  }
}
