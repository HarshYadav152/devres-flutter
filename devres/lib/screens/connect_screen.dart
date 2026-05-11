import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _copy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        backgroundColor: const Color(0xFF12121A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final socials = [
      _Social('GitHub', '@HarshYadav152', Icons.code_rounded, 'https://github.com/HarshYadav152', const Color(0xFFFFFFFF), '💻 Code & Projects'),
      _Social('LinkedIn', 'harshyadav152', Icons.work_rounded, 'https://linkedin.com/in/harshyadav152', const Color(0xFF0077B5), '💼 Professional'),
      _Social('Twitter / X', '@harshyadav_152', Icons.alternate_email, 'https://x.com/harshyadav_152', const Color(0xFF1DA1F2), '🐦 Thoughts & Updates'),
      _Social('Instagram', '@harshyadav_152', Icons.camera_alt_rounded, 'https://instagram.com/harshyadav_152', const Color(0xFFE4405F), '📸 Creative Side'),
      _Social('Medium', '@harshyadav152', Icons.article_rounded, 'https://medium.com/@harshyadav152', const Color(0xFFFFFFFF), '✍️ Articles & Blogs'),
      _Social('Bluesky', 'harshyadav152.bsky.social', Icons.cloud_rounded, 'https://bsky.app/profile/harshyadav152.bsky.social', const Color(0xFF0285FF), '🦋 Decentralized'),
      _Social('Discord', 'Community Server', Icons.headset_mic_rounded, 'https://discord.gg/mSsnpqgP', const Color(0xFF7289DA), '🎮 Community'),
      _Social('Portfolio', 'harshyadav152.vercel.app', Icons.language_rounded, 'https://harshyadav152.vercel.app', const Color(0xFF00F5FF), '🌐 Personal Site'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '// connect.sh',
                    style: TextStyle(
                      color: Color(0xFFFF006E),
                      fontSize: 13,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Let's Connect",
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Find me across the digital realm',
                    style: TextStyle(color: Colors.white.withOpacity(0.38), fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  // Email card
                  _EmailCard(onCopy: (text) => _copy(context, text), onLaunch: _launch),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _SocialCard(social: socials[i], onLaunch: _launch, onCopy: (t) => _copy(context, t)),
                ),
                childCount: socials.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _EmailCard extends StatelessWidget {
  final void Function(String) onCopy;
  final Future<void> Function(String) onLaunch;
  const _EmailCard({required this.onCopy, required this.onLaunch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF00F5FF).withOpacity(0.08),
            const Color(0xFFFF006E).withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF00F5FF).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00F5FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.email_rounded, color: Color(0xFF00F5FF), size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email', style: TextStyle(color: Colors.white54, fontSize: 12)),
                const Text(
                  'HarshYadav152@outlook.com',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy_rounded, color: Color(0xFF00F5FF), size: 18),
            onPressed: () => onCopy('HarshYadav152@outlook.com'),
          ),
          IconButton(
            icon: const Icon(Icons.open_in_new_rounded, color: Color(0xFF00F5FF), size: 18),
            onPressed: () => onLaunch('mailto:HarshYadav152@outlook.com'),
          ),
        ],
      ),
    );
  }
}

class _SocialCard extends StatelessWidget {
  final _Social social;
  final Future<void> Function(String) onLaunch;
  final void Function(String) onCopy;
  const _SocialCard({required this.social, required this.onLaunch, required this.onCopy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onLaunch(social.url),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF12121A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: social.color.withOpacity(0.12)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: social.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(social.icon, color: social.color, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    social.name,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(social.handle, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(social.desc, style: const TextStyle(color: Colors.white24, fontSize: 11)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.copy_rounded, size: 16, color: Colors.white24),
              onPressed: () => onCopy(social.url),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: social.color.withOpacity(0.6), size: 14),
          ],
        ),
      ),
    );
  }
}

class _Social {
  final String name, handle, url, desc;
  final IconData icon;
  final Color color;
  const _Social(this.name, this.handle, this.icon, this.url, this.color, this.desc);
}
