import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      _Category(
        title: 'Languages',
        icon: '💻',
        color: const Color(0xFF00F5FF),
        skills: ['JavaScript', 'TypeScript', 'Dart', 'Java', 'C', 'C++', 'PHP', 'HTML5', 'CSS3', 'Markdown'],
      ),
      _Category(
        title: 'Frameworks & Libraries',
        icon: '⚙️',
        color: const Color(0xFFFF006E),
        skills: ['Flutter', 'React', 'React Native', 'Next.js', 'Node.js', 'Express.js', 'Redux', 'TailwindCSS', 'Vite', 'Expo'],
      ),
      _Category(
        title: 'Databases',
        icon: '🗄️',
        color: const Color(0xFF3BDB87),
        skills: ['MongoDB', 'MySQL', 'PostgreSQL', 'Supabase', 'Firebase', 'Appwrite'],
      ),
      _Category(
        title: 'Cloud & Hosting',
        icon: '☁️',
        color: const Color(0xFF7B2FFF),
        skills: ['Google Cloud', 'Vercel', 'Netlify', 'Firebase Hosting', 'Nginx'],
      ),
      _Category(
        title: 'Tools & Design',
        icon: '🛠️',
        color: const Color(0xFFFFBE0B),
        skills: ['Git', 'GitHub', 'Figma', 'Canva', 'Blender', 'Framer', 'Notion', 'WordPress', 'NPM', 'PNPM'],
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
                    '// tech_toolbox',
                    style: TextStyle(
                      color: Color(0xFFFF006E),
                      fontSize: 13,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Skills & Stack',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Technologies I work with',
                    style: TextStyle(color: Colors.white.withOpacity(0.38), fontSize: 13),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _CategoryCard(category: categories[i]),
                ),
                childCount: categories.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final _Category category;
  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: category.color.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(category.icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 10),
              Text(
                category.title,
                style: TextStyle(
                  color: category.color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: category.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${category.skills.length}',
                  style: TextStyle(color: category.color, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills.map((s) => _SkillChip(label: s, color: category.color)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final Color color;
  const _SkillChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.18)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.withOpacity(0.85),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _Category {
  final String title, icon;
  final Color color;
  final List<String> skills;
  const _Category({required this.title, required this.icon, required this.color, required this.skills});
}
