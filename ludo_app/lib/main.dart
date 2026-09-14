import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const LudoWalaApp());

class LudoWalaApp extends StatelessWidget {
  const LudoWalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Wala • Age Palettes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEF6C43),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F7F2),
        fontFamily: 'Segoe UI',
      ),
      home: const PaletteHomePage(),
    );
  }
}

/// Backwards-compatibility alias for test runners and default Flutter templates
class MyApp extends LudoWalaApp {
  const MyApp({super.key});
}

class LudoColorInfo {
  const LudoColorInfo({
    required this.name,
    required this.role,
    required this.color,
    required this.hex,
    required this.icon,
  });

  final String name;
  final String role;
  final Color color;
  final String hex;
  final IconData icon;
}

class AgePalette {
  const AgePalette({
    required this.ageRange,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.ergonomics,
    required this.colors,
    required this.accent,
    required this.boardBg,
    required this.boardHex,
    required this.tags,
    required this.icon,
  });

  final String ageRange;
  final String title;
  final String subtitle;
  final String description;
  final String ergonomics;
  final List<LudoColorInfo> colors;
  final Color accent;
  final Color boardBg;
  final String boardHex;
  final List<String> tags;
  final IconData icon;
}

class PaletteHomePage extends StatefulWidget {
  const PaletteHomePage({super.key});

  @override
  State<PaletteHomePage> createState() => _PaletteHomePageState();
}

class _PaletteHomePageState extends State<PaletteHomePage> {
  int _selectedAgeIndex = 0;

  static const List<AgePalette> _palettes = [
    AgePalette(
      ageRange: '3 - 7',
      title: 'Candy Pop',
      subtitle: 'Little Players & Early Learners',
      description:
          'High-saturation, candy-bright primary tones crafted for developing visual perception and instant recognition.',
      ergonomics:
          'Young children thrive on warm, highly saturated hues that encourage motor action and hold attention. Pure, cheerful tones prevent confusion during turn-taking.',
      colors: [
        LudoColorInfo(
          name: 'Cherry Pop',
          role: 'Quadrant 1 • Red',
          color: Color(0xFFFF4D6D),
          hex: '#FF4D6D',
          icon: Icons.favorite_rounded,
        ),
        LudoColorInfo(
          name: 'Juicy Lime',
          role: 'Quadrant 2 • Green',
          color: Color(0xFF70E000),
          hex: '#70E000',
          icon: Icons.eco_rounded,
        ),
        LudoColorInfo(
          name: 'Banana Sun',
          role: 'Quadrant 3 • Yellow',
          color: Color(0xFFFFD166),
          hex: '#FFD166',
          icon: Icons.wb_sunny_rounded,
        ),
        LudoColorInfo(
          name: 'Sky Lagoon',
          role: 'Quadrant 4 • Blue',
          color: Color(0xFF00B4D8),
          hex: '#00B4D8',
          icon: Icons.water_drop_rounded,
        ),
      ],
      accent: Color(0xFFFFECEF),
      boardBg: Color(0xFFFFFDF5),
      boardHex: '#FFFDF5',
      tags: ['High Vibrancy', 'Playful', 'Instant Recognition'],
      icon: Icons.child_care_rounded,
    ),
    AgePalette(
      ageRange: '8 - 15',
      title: 'Arcade Neon',
      subtitle: 'Pre-Teens & Young Gamers',
      description:
          'Punchy electric contrast inspired by modern mobile battle games and competitive arcade interfaces.',
      ergonomics:
          'Teens gravitate toward dynamic, high-energy gaming palettes. Hyper-saturated accents provide exhilarating visual feedback when striking opponents or entering home tracks.',
      colors: [
        LudoColorInfo(
          name: 'Hyper Crimson',
          role: 'Quadrant 1 • Red',
          color: Color(0xFFFF0055),
          hex: '#FF0055',
          icon: Icons.bolt_rounded,
        ),
        LudoColorInfo(
          name: 'Cyber Mint',
          role: 'Quadrant 2 • Green',
          color: Color(0xFF00F5D4),
          hex: '#00F5D4',
          icon: Icons.videogame_asset_rounded,
        ),
        LudoColorInfo(
          name: 'Electric Amber',
          role: 'Quadrant 3 • Yellow',
          color: Color(0xFFFFB703),
          hex: '#FFB703',
          icon: Icons.flash_on_rounded,
        ),
        LudoColorInfo(
          name: 'Cobalt Pulse',
          role: 'Quadrant 4 • Blue',
          color: Color(0xFF4361EE),
          hex: '#4361EE',
          icon: Icons.rocket_launch_rounded,
        ),
      ],
      accent: Color(0xFFE8EEFF),
      boardBg: Color(0xFFF3F6FB),
      boardHex: '#F3F6FB',
      tags: ['Electric Pulse', 'Cyber Gamified', 'Dynamic Contrast'],
      icon: Icons.sports_esports_rounded,
    ),
    AgePalette(
      ageRange: '16 - 45',
      title: 'Nordic Matte',
      subtitle: 'Adults & Casual Game Nights',
      description:
          'Sophisticated, desaturated earth-infused palette designed for calm focus and screen-glare reduction.',
      ergonomics:
          'Adults prefer aesthetic minimalism over intense neon primaries. Muted terracotta, sage, ochre, and slate reduce eye strain during prolonged coffee-table or evening play.',
      colors: [
        LudoColorInfo(
          name: 'Terracotta',
          role: 'Quadrant 1 • Red',
          color: Color(0xFFE06D53),
          hex: '#E06D53',
          icon: Icons.local_fire_department_rounded,
        ),
        LudoColorInfo(
          name: 'Muted Pine',
          role: 'Quadrant 2 • Green',
          color: Color(0xFF52796F),
          hex: '#52796F',
          icon: Icons.park_rounded,
        ),
        LudoColorInfo(
          name: 'Dijon Ochre',
          role: 'Quadrant 3 • Yellow',
          color: Color(0xFFE9C46A),
          hex: '#E9C46A',
          icon: Icons.lightbulb_rounded,
        ),
        LudoColorInfo(
          name: 'Slate Denim',
          role: 'Quadrant 4 • Blue',
          color: Color(0xFF2A6F97),
          hex: '#2A6F97',
          icon: Icons.waves_rounded,
        ),
      ],
      accent: Color(0xFFF2ECE4),
      boardBg: Color(0xFFF8F6F0),
      boardHex: '#F8F6F0',
      tags: ['Matte Minimal', 'Low Eye Strain', 'Coffee Table Aesthetic'],
      icon: Icons.coffee_rounded,
    ),
    AgePalette(
      ageRange: '50+',
      title: 'Heritage Contrast',
      subtitle: 'Seniors & Golden Age (Universal Accessibility)',
      description:
          'High-luminance, anti-glare tones engineered to meet WCAG standards and prevent red-green confusion.',
      ergonomics:
          'Ageing eyes experience reduced contrast sensitivity and crystalline lens yellowing. Deep spruce teal replaces standard green to eliminate deuteranopia ambiguity, paired with deep cardinal red.',
      colors: [
        LudoColorInfo(
          name: 'Cardinal Crimson',
          role: 'Quadrant 1 • Red',
          color: Color(0xFFC1121F),
          hex: '#C1121F',
          icon: Icons.shield_rounded,
        ),
        LudoColorInfo(
          name: 'Spruce Teal',
          role: 'Quadrant 2 • Green',
          color: Color(0xFF1B6A56),
          hex: '#1B6A56',
          icon: Icons.spa_rounded,
        ),
        LudoColorInfo(
          name: 'Marigold Ochre',
          role: 'Quadrant 3 • Yellow',
          color: Color(0xFFD48C00),
          hex: '#D48C00',
          icon: Icons.stars_rounded,
        ),
        LudoColorInfo(
          name: 'Royal Navy',
          role: 'Quadrant 4 • Blue',
          color: Color(0xFF004B87),
          hex: '#004B87',
          icon: Icons.anchor_rounded,
        ),
      ],
      accent: Color(0xFFF6F0E6),
      boardBg: Color(0xFFFCFBF7),
      boardHex: '#FCFBF7',
      tags: ['WCAG AAA', 'Anti-Glare', 'Colorblind Friendly'],
      icon: Icons.visibility_rounded,
    ),
  ];

  void _copyHex(BuildContext context, LudoColorInfo colorInfo) {
    Clipboard.setData(ClipboardData(text: colorInfo.hex)).then((_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: const Color(0xFF222222),
          duration: const Duration(seconds: 2),
          content: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: colorInfo.color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Copied ${colorInfo.hex} (${colorInfo.name}) to clipboard',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = _palettes[_selectedAgeIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF201E1D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.casino_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LUDO WALA',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    fontSize: 18,
                    color: Color(0xFF201E1D),
                  ),
                ),
                Text(
                  'Age-Targeted Color Systems',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF7A7067),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tap any color swatch below to copy its HEX code!'),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'Palette Info',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Player Age Bracket',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF201E1D),
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Harmonious 4-player palettes backed by color psychology and visual ergonomics.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF6B625A),
                        ),
                  ),
                  const SizedBox(height: 18),

                  // Age Category Switcher
                  _AgeSelector(
                    selected: _selectedAgeIndex,
                    palettes: _palettes,
                    onChanged: (index) => setState(() => _selectedAgeIndex = index),
                  ),
                  const SizedBox(height: 20),

                  // Animated Preview Card with Authentic Board
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: _PalettePreview(
                      key: ValueKey(_selectedAgeIndex),
                      palette: palette,
                      onTapColor: (info) => _copyHex(context, info),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Color Swatches / Hex Inspector Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quadrant Color Breakdown',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF201E1D),
                            ),
                      ),
                      const Text(
                        'Tap to copy HEX',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8A7E73),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 4 Color Swatch Cards
                  Row(
                    children: [
                      for (final colorInfo in palette.colors)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: _ColorInspectorChip(
                              info: colorInfo,
                              onTap: () => _copyHex(context, colorInfo),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Ergonomics & Psychology Insight Card
                  _ErgonomicsCard(palette: palette),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AgeSelector extends StatelessWidget {
  const _AgeSelector({
    required this.selected,
    required this.palettes,
    required this.onChanged,
  });

  final int selected;
  final List<AgePalette> palettes;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 480;
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < palettes.length; i++)
              SizedBox(
                width: isNarrow ? (constraints.maxWidth - 8) / 2 : null,
                child: ChoiceChip(
                  avatar: Icon(
                    palettes[i].icon,
                    size: 18,
                    color: selected == i ? Colors.white : const Color(0xFF6B625A),
                  ),
                  selected: selected == i,
                  label: Text(
                    '${palettes[i].ageRange} • ${palettes[i].title}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: selected == i ? Colors.white : const Color(0xFF332D27),
                    ),
                  ),
                  selectedColor: const Color(0xFF201E1D),
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  showCheckmark: false,
                  elevation: selected == i ? 2 : 0,
                  side: BorderSide(
                    color: selected == i
                        ? Colors.transparent
                        : const Color(0xFFE2DCD2),
                    width: 1.2,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  onSelected: (_) => onChanged(i),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _PalettePreview extends StatelessWidget {
  const _PalettePreview({
    super.key,
    required this.palette,
    required this.onTapColor,
  });

  final AgePalette palette;
  final ValueChanged<LudoColorInfo> onTapColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: palette.accent,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Icon(
                  palette.icon,
                  size: 28,
                  color: const Color(0xFF201E1D),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          palette.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF201E1D),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFF201E1D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Ages ${palette.ageRange}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      palette.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF635A52),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            palette.description,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: Color(0xFF473F38),
            ),
          ),
          const SizedBox(height: 14),

          // Tags row
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final tag in palette.tags)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4F453D),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),

          // Realistic Ludo Board Preview
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 340),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: _LudoRealisticBoard(
                  palette: palette,
                  onTapColor: onTapColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A realistic 15x15 Ludo board preview rendered faithfully to authentic board layout
class _LudoRealisticBoard extends StatelessWidget {
  const _LudoRealisticBoard({
    required this.palette,
    required this.onTapColor,
  });

  final AgePalette palette;
  final ValueChanged<LudoColorInfo> onTapColor;

  @override
  Widget build(BuildContext context) {
    final red = palette.colors[0];
    final green = palette.colors[1];
    final yellow = palette.colors[2];
    final blue = palette.colors[3];

    return Container(
      decoration: BoxDecoration(
        color: palette.boardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF332D27).withValues(alpha: 0.18),
          width: 2.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Column(
          children: [
            // Top Row (Red Base + Top Arm + Green Base)
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _HomeBase(
                      colorInfo: red,
                      onTap: () => onTapColor(red),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: _VerticalArm(
                      pathColor: green.color,
                      isTop: true,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: _HomeBase(
                      colorInfo: green,
                      onTap: () => onTapColor(green),
                    ),
                  ),
                ],
              ),
            ),

            // Middle Row (Left Arm + Center Triangle + Right Arm)
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _HorizontalArm(
                      pathColor: red.color,
                      isLeft: true,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: _CenterFinish(palette: palette),
                  ),
                  Expanded(
                    flex: 6,
                    child: _HorizontalArm(
                      pathColor: yellow.color,
                      isLeft: false,
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Row (Blue Base + Bottom Arm + Yellow Base)
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _HomeBase(
                      colorInfo: blue,
                      onTap: () => onTapColor(blue),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: _VerticalArm(
                      pathColor: blue.color,
                      isTop: false,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: _HomeBase(
                      colorInfo: yellow,
                      onTap: () => onTapColor(yellow),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeBase extends StatelessWidget {
  const _HomeBase({
    required this.colorInfo,
    required this.onTap,
  });

  final LudoColorInfo colorInfo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: colorInfo.color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.15),
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TokenCircle(color: colorInfo.color),
                  _TokenCircle(color: colorInfo.color),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TokenCircle(color: colorInfo.color),
                  _TokenCircle(color: colorInfo.color),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TokenCircle extends StatelessWidget {
  const _TokenCircle({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black.withValues(alpha: 0.2), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
    );
  }
}

class _VerticalArm extends StatelessWidget {
  const _VerticalArm({
    required this.pathColor,
    required this.isTop,
  });

  final Color pathColor;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        children: List.generate(6, (r) {
          final row = isTop ? r : 5 - r;
          return Expanded(
            child: Row(
              children: List.generate(3, (col) {
                final isHomeLane = col == 1 && row > 0;
                final isStartSquare = (isTop && row == 1 && col == 2) ||
                    (!isTop && row == 1 && col == 0);

                final cellColor = isHomeLane
                    ? pathColor
                    : (isStartSquare ? pathColor.withValues(alpha: 0.35) : Colors.white);

                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(0.5),
                    decoration: BoxDecoration(
                      color: cellColor,
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.12),
                        width: 0.6,
                      ),
                    ),
                    child: isStartSquare
                        ? Center(
                            child: Icon(
                              Icons.star_rounded,
                              size: 10,
                              color: pathColor,
                            ),
                          )
                        : null,
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}

class _HorizontalArm extends StatelessWidget {
  const _HorizontalArm({
    required this.pathColor,
    required this.isLeft,
  });

  final Color pathColor;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        children: List.generate(3, (row) {
          return Expanded(
            child: Row(
              children: List.generate(6, (c) {
                final col = isLeft ? c : 5 - c;
                final isHomeLane = row == 1 && col > 0;
                final isStartSquare = (isLeft && col == 1 && row == 0) ||
                    (!isLeft && col == 1 && row == 2);

                final cellColor = isHomeLane
                    ? pathColor
                    : (isStartSquare ? pathColor.withValues(alpha: 0.35) : Colors.white);

                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(0.5),
                    decoration: BoxDecoration(
                      color: cellColor,
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.12),
                        width: 0.6,
                      ),
                    ),
                    child: isStartSquare
                        ? Center(
                            child: Icon(
                              Icons.star_rounded,
                              size: 10,
                              color: pathColor,
                            ),
                          )
                        : null,
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}

class _CenterFinish extends StatelessWidget {
  const _CenterFinish({required this.palette});
  final AgePalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withValues(alpha: 0.2), width: 1),
      ),
      child: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: _CenterTrianglePainter(
              red: palette.colors[0].color,
              green: palette.colors[1].color,
              yellow: palette.colors[2].color,
              blue: palette.colors[3].color,
            ),
          ),
          const Center(
            child: CircleAvatar(
              radius: 9,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.emoji_events_rounded,
                size: 12,
                color: Color(0xFFD4A373),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CenterTrianglePainter extends CustomPainter {
  _CenterTrianglePainter({
    required this.red,
    required this.green,
    required this.yellow,
    required this.blue,
  });

  final Color red;
  final Color green;
  final Color yellow;
  final Color blue;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..style = PaintingStyle.fill;

    // Top Triangle (Green)
    paint.color = green;
    final topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(center.dx, center.dy)
      ..close();
    canvas.drawPath(topPath, paint);

    // Left Triangle (Red)
    paint.color = red;
    final leftPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(center.dx, center.dy)
      ..close();
    canvas.drawPath(leftPath, paint);

    // Bottom Triangle (Blue)
    paint.color = blue;
    final bottomPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(center.dx, center.dy)
      ..close();
    canvas.drawPath(bottomPath, paint);

    // Right Triangle (Yellow)
    paint.color = yellow;
    final rightPath = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(center.dx, center.dy)
      ..close();
    canvas.drawPath(rightPath, paint);
  }

  @override
  bool shouldRepaint(covariant _CenterTrianglePainter oldDelegate) {
    return oldDelegate.red != red ||
        oldDelegate.green != green ||
        oldDelegate.yellow != yellow ||
        oldDelegate.blue != blue;
  }
}

class _ColorInspectorChip extends StatelessWidget {
  const _ColorInspectorChip({
    required this.info,
    required this.onTap,
  });

  final LudoColorInfo info;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.08),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: info.color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.12),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: info.color.withValues(alpha: 0.35),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                info.icon,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              info.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 12,
                color: Color(0xFF221E1A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              info.hex,
              style: const TextStyle(
                fontFamily: 'Courier',
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: Color(0xFF7A6F65),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErgonomicsCard extends StatelessWidget {
  const _ErgonomicsCard({required this.palette});
  final AgePalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF6C43).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.psychology_rounded,
                  color: Color(0xFFEF6C43),
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Why this works for this age',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF201E1D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            palette.ergonomics,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF594F47),
            ),
          ),
          const Divider(height: 24, thickness: 0.8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Board Canvas Tone',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF7A6E63),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: palette.boardBg,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black26),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    palette.boardHex,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF332D27),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
