import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harsh Yadav (HarshYadav152) — Developer Resources',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117), // --bg
        cardColor: const Color(0xFF161B22), // --panel
        dividerColor: const Color(0xFF30363D), // --border
        primaryColor: const Color(0xFF2F81F7), 
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2F81F7), // --accent
          surface: Color(0xFF161B22),
          onSurface: Color(0xFFE6EDF3), // --text
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFE6EDF3), fontSize: 16, height: 1.6),
          bodyLarge: TextStyle(color: Color(0xFFE6EDF3), fontSize: 18, height: 1.6),
          titleLarge: TextStyle(color: Color(0xFFE6EDF3), fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(color: Color(0xFFE6EDF3), fontWeight: FontWeight.bold, fontSize: 32, height: 1.3),
          headlineMedium: TextStyle(color: Color(0xFFE6EDF3), fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dynamic padding based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 600 ? 16.0 : 40.0;
    final verticalPadding = screenWidth < 600 ? 24.0 : 60.0;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 48),

                _buildSectionTitle(context, 'Connect with Harsh Yadav'),
                const SizedBox(height: 24),
                _buildSocialGrid(context, screenWidth),
                const SizedBox(height: 56),

                _buildTwoColSection(context, screenWidth),
                const SizedBox(height: 56),

                _buildSectionTitle(context, 'FAQ about Harsh Yadav (152)'),
                const SizedBox(height: 24),
                _buildFAQSection(),
                const SizedBox(height: 56),

                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Home',
          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Text(
          'Harsh Yadav (HarshYadav152) — Developer Resources & Portfolio',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
            children: const [
              TextSpan(text: "I'm "),
              TextSpan(text: "Harsh Yadav", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              TextSpan(text: " — a Developer from "),
              TextSpan(text: "Aligarh", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              TextSpan(text: ", India, known online as "),
              TextSpan(text: "HarshYadav152", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              TextSpan(text: " or simply "),
              TextSpan(text: "152", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              TextSpan(text: ". Search for \"152\", \"Harsh152\", or \"HarshYadav152\" to find my profiles across platforms. Explore my curated developer resources, recent projects, and ways to connect."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget _buildSocialGrid(BuildContext context, double screenWidth) {
    // If screen is smaller than 600px, take full width. Otherwise, max out at 280px.
    final double cardWidth = screenWidth < 600 ? double.infinity : 280;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: _SocialsData.items.map((social) {
        return SizedBox(
          width: cardWidth,
          child: _SocialCard(
            title: social['title'] as String,
            description: social['desc'] as String,
            icon: social['icon'] as IconData,
            hoverColor: social['color'] as Color,
            url: social['url'] as String,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTwoColSection(BuildContext context, double screenWidth) {
    bool isWide = screenWidth > 768; // Adjusted breakpoint for a better tablet experience

    List<Widget> columns = [
      Expanded(
        flex: isWide ? 1 : 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'About 152'),
            const SizedBox(height: 16),
            Text(
              "I build scalable, maintainable web applications with a focus on clean code, system architecture, and developer experience. My online identity 152 represents my consistent presence across developer platforms.\n\n"
              "Whether you search for \"152 developer\", \"Harsh152 projects\", or \"HarshYadav152 portfolio\", you'll find my work and profiles easily accessible.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      if (isWide) const SizedBox(width: 32),
      if (!isWide) const SizedBox(height: 40),
      Expanded(
        flex: isWide ? 1 : 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Featured Developer Resources'),
            const SizedBox(height: 16),
            _buildBulletPoint('System Design — architecture patterns and scalability concepts'),
            _buildBulletPoint('Developer Tools — curated productivity tools I recommend'),
            _buildBulletPoint('Learning Paths — structured paths for modern development'),
            const SizedBox(height: 16),
            Text(
              "I periodically publish notes and articles under the handle 152. Follow me on Dev.to and X (Twitter) for updates.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    ];

    return isWide
        ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: columns)
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: columns);
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18, color: Colors.white70)),
          Expanded(child: Text(text, style: const TextStyle(height: 1.5))),
        ],
      ),
    );
  }

  Widget _buildFAQSection() {
    return Column(
      children: _FAQData.items.map((faq) => _FAQTile(
        question: faq['question']!,
        answer: faq['answer']!,
      )).toList(),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF30363D))),
      ),
      child: const Text(
        'Last updated: April 03, 2026',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white54, fontSize: 13, letterSpacing: 0.5),
      ),
    );
  }
}

// -----------------------------------------------------
// Component Widgets tailored for the design
// -----------------------------------------------------

class _SocialCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color hoverColor;
  final String url;

  const _SocialCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.hoverColor,
    required this.url,
  });

  @override
  State<_SocialCard> createState() => _SocialCardState();
}

class _SocialCardState extends State<_SocialCard> {
  bool _isHovered = false;

  void _launchURL() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      debugPrint('Clicked on ${widget.url}');
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: _launchURL,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(16),
          transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0), // Slight lift up effect
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? widget.hoverColor : Theme.of(context).dividerColor,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [BoxShadow(color: widget.hoverColor.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 8))]
                : [const BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))],
          ),
          child: Row(
            children: [
              Icon(widget.icon, size: 32, color: _isHovered ? widget.hoverColor : Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 13, color: Colors.white70),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              question,
              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(answer, style: const TextStyle(color: Colors.white70, height: 1.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------
// Data Models (Extracted for better structure)
// -----------------------------------------------------

class _SocialsData {
  static const List<Map<String, dynamic>> items = [
    {
      'title': 'LinkedIn',
      'desc': 'Professional network & updates',
      'icon': Icons.business,
      'url': 'https://www.linkedin.com/in/harshyadav152?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFF0A66C2),
    },
    {
      'title': 'GitHub',
      'desc': 'Code repositories & projects',
      'icon': Icons.code,
      'url': 'https://github.com/HarshYadav152?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFF6e40c9),
    },
    {
      'title': 'Twitter/X',
      'desc': 'Tech thoughts & conversations',
      'icon': Icons.alternate_email,
      'url': 'https://twitter.com/harshyadav_152?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFF1DA1F2),
    },
    {
      'title': 'Dev.to',
      'desc': 'Articles & technical content',
      'icon': Icons.article,
      'url': 'https://dev.to/harshyadav152?utm_source=HarshYadav152-windows-application',
      'color': Colors.white,
    },
    {
      'title': 'Instagram',
      'desc': 'Photos & behind the scenes',
      'icon': Icons.camera_alt,
      'url': 'https://www.instagram.com/harshyadav_152?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFFE1306C),
    },
    {
      'title': 'Medium',
      'desc': 'In-depth blogs & tutorials',
      'icon': Icons.menu_book,
      'url': 'https://medium.com/@harshyadav152?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFF00AB6C),
    },
    {
      'title': 'Discord',
      'desc': 'Chat & join the conversation',
      'icon': Icons.forum,
      'url': 'https://discord.gg/8BTMXmty8g?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFF5865F2),
    },
    {
      'title': 'Company',
      'desc': 'Profession',
      'icon': Icons.groups,
      'url': 'https://geetasystems.co.in?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFFFF9900),
    },
    {
      'title': 'Email',
      'desc': 'Direct contact',
      'icon': Icons.email,
      'url': 'mailto:harshyadav152@outlook.com',
      'color': Color(0xFFEA4335),
    },
    {
      'title': 'Portfolio',
      'desc': 'Projects & case studies',
      'icon': Icons.web,
      'url': 'https://harsh.geetasystems.co.in?utm_source=HarshYadav152-windows-application',
      'color': Color(0xFF4285F4),
    },
  ];
}

class _FAQData {
  static const List<Map<String, String>> items = [
    {
      'question': 'Who is Harsh Yadav (HarshYadav152)?',
      'answer': 'Harsh Yadav is a Full-Stack Developer from Aligarh, known online as HarshYadav152 or 152.',
    },
    {
      'question': 'What does “152” stand for?',
      'answer': 'It’s my unique handle across platforms—easy to search and remember. You’ll find me as 152 or HarshYadav152.',
    },
    {
      'question': 'Where can I see Harsh Yadav’s portfolio?',
      'answer': 'Visit my portfolio (https://harsh.geetasystems.co.in) for projects, write-ups, and case studies.',
    },
    {
      'question': 'Where is Harsh Yadav from?',
      'answer': 'I’m based in Aligarh, India.',
    },
  ];
}