import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final projects = [
      _Project(
        name: 'G-secure',
        emoji: '🔐',
        desc: 'Open-source password manager with zero knowledge architecture, AES encryption, breach check, and strong password generation. Built at HackGear1.0.',
        tech: ['React', 'Node.js', 'MongoDB', 'JWT', 'bcrypt'],
        github: 'https://github.com/HarshYadav152/Gsecure',
        live: 'https://gsecure.geetasystems.co.in',
        color: const Color(0xFF00F5FF),
      ),
      _Project(
        name: 'git-galary',
        emoji: '🖼️',
        desc: 'Futuristic GitHub avatar explorer with neon glassmorphism UI. Discover random GitHub users, filter by repos/followers/stars, download avatars.',
        tech: ['Next.js', 'TypeScript', 'Tailwind', 'GitHub API'],
        github: 'https://github.com/HarshYadav152/git-galary',
        live: 'https://git-galary.vercel.app',
        color: const Color(0xFFFF006E),
      ),
      _Project(
        name: 'SaveBook',
        emoji: '📝',
        desc: 'Modern note-taking & knowledge management web app. Create, edit, and organize notes with a clean responsive UI built on Next.js.',
        tech: ['Next.js', 'React', 'JavaScript'],
        github: 'https://github.com/HarshYadav152/SaveBook',
        live: 'https://save-book.vercel.app',
        color: const Color(0xFF7B2FFF),
      ),
      _Project(
        name: 'SS-Capture',
        emoji: '📸',
        desc: 'Full page screenshot browser extension with glassmorphic UI. Handles pages exceeding 32,000px via intelligent chunking and stitching.',
        tech: ['JavaScript', 'Chrome API', 'Canvas API'],
        github: 'https://github.com/HarshYadav152/ss-capture',
        live: null,
        color: const Color(0xFFFFBE0B),
      ),
      _Project(
        name: 'GS-CodeCount',
        emoji: '🧮',
        desc: 'NPM package to count total lines of code across different programming languages in your project. Simple CLI tool for developers.',
        tech: ['Node.js', 'NPM', 'CLI'],
        github: 'https://github.com/GeetaSystems/GS-codecount',
        live: 'https://npmjs.com/package/gs-codecount',
        color: const Color(0xFF3BDB87),
      ),
      _Project(
        name: 'MongoDB Client',
        emoji: '🗄️',
        desc: 'Web-based GUI client for managing MongoDB databases and collections. Visual interface to interact with your MongoDB instance.',
        tech: ['React', 'Node.js', 'MongoDB'],
        github: 'https://github.com/HarshYadav152/mongodb-client',
        live: null,
        color: const Color(0xFF00ED64),
      ),
      _Project(
        name: 'Social Redirect',
        emoji: '🔗',
        desc: 'Lightweight social media profile redirector built with React. Create clean short URLs to all social profiles with zero dependencies.',
        tech: ['React', 'JavaScript', 'CSS'],
        github: 'https://github.com/HarshYadav152/social',
        live: null,
        color: const Color(0xFFFF6B6B),
      ),
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
                    '// projects',
                    style: TextStyle(
                      color: Color(0xFFFF006E),
                      fontSize: 13,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Featured Work',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${projects.length} projects • Open Source',
                    style: const TextStyle(color: Colors.white38, fontSize: 13),
                  ),
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
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _ProjectCard(project: projects[i], onLaunch: _launch),
                ),
                childCount: projects.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _Project project;
  final Future<void> Function(String) onLaunch;
  const _ProjectCard({required this.project, required this.onLaunch});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: project.color.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: project.color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(project.emoji, style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        project.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  project.desc,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.tech.map((t) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: project.color.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: project.color.withOpacity(0.2)),
                    ),
                    child: Text(
                      t,
                      style: TextStyle(
                        color: project.color,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _ActionBtn(
                      label: 'GitHub',
                      icon: Icons.code,
                      color: Colors.white54,
                      onTap: () => onLaunch(project.github),
                    ),
                    if (project.live != null) ...[
                      const SizedBox(width: 10),
                      _ActionBtn(
                        label: 'Live Demo',
                        icon: Icons.open_in_new,
                        color: project.color,
                        onTap: () => onLaunch(project.live!),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _ActionBtn({required this.label, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: color.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 14),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _Project {
  final String name, emoji, desc, github;
  final String? live;
  final List<String> tech;
  final Color color;
  const _Project({
    required this.name,
    required this.emoji,
    required this.desc,
    required this.tech,
    required this.github,
    required this.color,
    this.live,
  });
}
