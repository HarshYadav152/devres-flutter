import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildBio(),
            const SizedBox(height: 32),
            _buildQuickLinks(),
            const SizedBox(height: 32),
            _buildStats(),
            const SizedBox(height: 32),
            _buildFunFact(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Avatar with glow effect
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF00F5FF), Color(0xFFFF006E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00F5FF).withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(2), // border gap
                child: ClipOval(
                  child: Image.network(
                    'https://raw.githubusercontent.com/HarshYadav152/resources/main/images/hy152/152.jpg',
                    fit: BoxFit.cover,
                    // Fallback agar image load na ho
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF0A0A0F),
                        child: const Center(
                          child: Text(
                            'HY',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: const Color(0xFF0A0A0F),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF00F5FF),
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harsh Yadav',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '∞ Infinite Void Architect',
                    style: TextStyle(
                      color: const Color(0xFF00F5FF).withOpacity(0.8),
                      fontSize: 13,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF00F5FF).withOpacity(0.08),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF00F5FF).withOpacity(0.2)),
          ),
          child: const Text(
            '> Developer | OSS Enthusiast | New Tech Explorer',
            style: TextStyle(
              color: Color(0xFF00F5FF),
              fontSize: 12,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBio() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: '// about.txt'),
          const SizedBox(height: 12),
          const Text(
            'Someone who gets very excited when something new in tech comes along '
            'and is always eager to learn. I thrive at the intersection of clean code '
            'and creative problem solving.',
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.7),
          ),
          const SizedBox(height: 12),
          const Text(
            'Building tech that actually helps people, playing with emerging tech, '
            'and collaborating with devs & designers worldwide — that\'s what drives me.',
            style: TextStyle(color: Colors.white54, fontSize: 13, height: 1.7),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Tag('Open Source'),
              _Tag('Flutter'),
              _Tag('React'),
              _Tag('Node.js'),
              _Tag('Next.js'),
              _Tag('UI/UX'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinks() {
    final links = [
      _QuickLink('GitHub', Icons.code, 'https://github.com/HarshYadav152', const Color(0xFFFFFFFF)),
      _QuickLink('LinkedIn', Icons.work, 'https://linkedin.com/in/harshyadav152', const Color(0xFF0077B5)),
      _QuickLink('Portfolio', Icons.language, 'https://harshyadav152.vercel.app', const Color(0xFF00F5FF)),
      _QuickLink('Twitter/X', Icons.alternate_email, 'https://x.com/harshyadav_152', const Color(0xFF1DA1F2)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle(title: '// quick_links'),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.8,
          children: links.map((l) => _QuickLinkCard(l, _launch)).toList(),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: '// stats.json'),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatItem(value: '7+', label: 'Projects'),
              _StatItem(value: '5+', label: 'Tech Stacks'),
              _StatItem(value: '152', label: 'Universe ID'),
              _StatItem(value: '∞', label: 'Curiosity'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFunFact() {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: '// fun_fact.exe'),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('☕', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Code + hollow purple = productivity overload',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('🧠', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Suggest a tech/tool and I\'ll probably try it by tomorrow',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickLinkCard extends StatelessWidget {
  final _QuickLink link;
  final Future<void> Function(String) onTap;
  const _QuickLinkCard(this.link, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(link.url),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF12121A),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: link.color.withOpacity(0.2)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Icon(link.icon, color: link.color, size: 18),
            const SizedBox(width: 10),
            Text(
              link.name,
              style: TextStyle(
                color: link.color,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickLink {
  final String name;
  final IconData icon;
  final String url;
  final Color color;
  const _QuickLink(this.name, this.icon, this.url, this.color);
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF00F5FF),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 11)),
      ],
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: child,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFFFF006E),
        fontSize: 13,
        fontWeight: FontWeight.bold,
        fontFamily: 'monospace',
        letterSpacing: 1,
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  const _Tag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF00F5FF).withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF00F5FF).withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF00F5FF),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}