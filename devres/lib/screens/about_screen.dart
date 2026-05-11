import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '// about.me',
              style: TextStyle(
                color: Color(0xFFFF006E),
                fontSize: 13,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'About Me',
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Identity card
            _buildIdentityCard(),
            const SizedBox(height: 20),

            // What drives me
            _buildDrivesCard(),
            const SizedBox(height: 20),

            // NPM Package highlight
            _buildNpmCard(),
            const SizedBox(height: 20),

            // Collaboration
            _buildCollabCard(),
            const SizedBox(height: 20),

            // The 42 connection easter egg
            _buildEasterEgg(),
            const SizedBox(height: 20),

            // App info
            _buildAppInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildIdentityCard() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Label('// identity'),
          const SizedBox(height: 14),
          _InfoRow('Name', 'Harsh Yadav'),
          _InfoRow('Alias', 'HarshYadav152'),
          _InfoRow('Role', 'Software Developer'),
          _InfoRow('Location', 'Aligarh, Uttar Pradesh, India'),
          _InfoRow('Universe ID', '152 → ∞ (Infinite Void)'),
          _InfoRow('Status', '🟢 Open to collaborate'),
        ],
      ),
    );
  }

  Widget _buildDrivesCard() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Label('// what_drives_me'),
          const SizedBox(height: 14),
          _DriveItem('🔧', 'Building tech that actually helps people'),
          _DriveItem('🧪', 'Playing with new, emerging, and sometimes weird tech'),
          _DriveItem('🤝', 'Collaborating with devs, designers, and creators worldwide'),
          _DriveItem('📖', 'Always learning — suggest a tool and I\'ll try it by tomorrow'),
          _DriveItem('🌐', 'Open Source contributions and community'),
        ],
      ),
    );
  }

  Widget _buildNpmCard() {
    return GestureDetector(
      onTap: () => _launch('https://npmjs.com/package/gs-codecount'),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF3BDB87).withOpacity(0.08),
              const Color(0xFF00F5FF).withOpacity(0.04),
            ],
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF3BDB87).withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFCC3534),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'npm',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Published Package',
                  style: TextStyle(color: Color(0xFF3BDB87), fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'gs-codecount',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
            ),
            const SizedBox(height: 6),
            const Text(
              'Count total lines of code across different programming languages in your project. Simple yet powerful CLI tool for developers.',
              style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.6),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "npm install gs-codecount",
                style: TextStyle(color: Color(0xFF3BDB87), fontSize: 13, fontFamily: 'monospace'),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.open_in_new, color: Color(0xFF3BDB87), size: 14),
                const SizedBox(width: 6),
                Text(
                  'View on NPM →',
                  style: TextStyle(color: const Color(0xFF3BDB87).withOpacity(0.8), fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollabCard() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Label('// collaborate'),
          const SizedBox(height: 12),
          const Text(
            'Got a cool idea? Want to build something awesome together?',
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
          ),
          const SizedBox(height: 8),
          const Text(
            'PRs, issues, forks — feel free to dive in! Always open to collaboration, open-source contributions, or even techie banter.',
            style: TextStyle(color: Colors.white54, fontSize: 13, height: 1.6),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => _launch('https://github.com/HarshYadav152'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00F5FF), Color(0xFF7B2FFF)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.code, color: Colors.black, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'View GitHub Profile',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEasterEgg() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '// void_decoded',
            style: TextStyle(color: Colors.white24, fontSize: 11, fontFamily: 'monospace'),
          ),
          const SizedBox(height: 10),
          Text(
            '152 → 1+5+2 = 8 → binary: 1000 → rotate 90°: ∞',
            style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12, fontFamily: 'monospace'),
          ),
          const SizedBox(height: 4),
          Text(
            'The void is infinite. You are literally made of 42.',
            style: TextStyle(color: Colors.white.withOpacity(0.2), fontSize: 11, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildAppInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Label('// app_info'),
          const SizedBox(height: 12),
          _InfoRow('App', 'HarshYadav152 Dev Hub'),
          _InfoRow('Version', '1.0.2.0'),
          _InfoRow('Built with', 'Flutter 🐦'),
          _InfoRow('Platform', 'Windows'),
          _InfoRow('Purpose', 'Developer Resource Hub'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white38, fontSize: 13),
            ),
          ),
          const Text('→ ', style: TextStyle(color: Color(0xFF00F5FF), fontSize: 13)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _DriveItem extends StatelessWidget {
  final String emoji, text;
  const _DriveItem(this.emoji, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.5)),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: child,
    );
  }
}

class _Label extends StatelessWidget {
  final String title;
  const _Label(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFFFF006E),
        fontSize: 12,
        fontFamily: 'monospace',
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}
