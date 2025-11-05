import 'package:flutter/material.dart';
import 'package:ride_hailing/domain/members/member.dart';

class MemberDetailPage extends StatelessWidget {
  final Member member;
  const MemberDetailPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Member Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(member.avatar),
                  child: member.avatar.isEmpty
                      ? Text(member.firstName.isNotEmpty ? member.firstName[0] : '?')
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${member.firstName} ${member.lastName}', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text('Status: ${member.status}')
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Text('Relationship: ${member.relationship}'),
            const SizedBox(height: 8),
            Text('Age: ${member.age}'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Screen Time Enabled:'),
                const SizedBox(width: 8),
                Switch(value: member.screenTimeEnabled, onChanged: null),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
