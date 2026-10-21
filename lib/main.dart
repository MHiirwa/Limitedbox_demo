import 'package:flutter/material.dart';

void main() => runApp(const NbaRankingDemoApp());

/// -----------------------------------------------------------------------
/// LimitedBox Demo — "NBA Team Rankings"
///
/// Real-world scenario:
/// An NBA app displays team rankings in a horizontally-scrolling row.
///
/// A horizontal ListView gives its children UNBOUNDED width constraints.
/// LimitedBox provides a maximum width/height when the incoming constraint
/// is unbounded.
/// -----------------------------------------------------------------------

class NbaRankingDemoApp extends StatelessWidget {
  const NbaRankingDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBA Team Rankings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const NbaRankingScreen(),
    );
  }
}

class NbaRankingScreen extends StatefulWidget {
  const NbaRankingScreen({super.key});

  @override
  State<NbaRankingScreen> createState() => _NbaRankingScreenState();
}

class _NbaRankingScreenState extends State<NbaRankingScreen> {
  // -----------------------------------------------------------------------
  // LimitedBox properties
  // -----------------------------------------------------------------------

  // Property 1: maxWidth
  double _maxWidth = 100;

  // Property 2: maxHeight
  double _maxHeight = 100;

  // Property 3: child
  bool _useTeamLogo = true;

  // Sample NBA teams for the demonstration.
  final List<Map<String, String>> _teams = [
    {
      'rank': '1',
      'team': 'Boston Celtics',
      'record': '64 - 18',
      'abbr': 'BOS',
    },
    {
      'rank': '2',
      'team': 'Oklahoma City',
      'record': '60 - 22',
      'abbr': 'OKC',
    },
    {
      'rank': '3',
      'team': 'Denver Nuggets',
      'record': '57 - 25',
      'abbr': 'DEN',
    },
    {
      'rank': '4',
      'team': 'Minnesota',
      'record': '56 - 26',
      'abbr': 'MIN',
    },
    {
      'rank': '5',
      'team': 'New York',
      'record': '54 - 28',
      'abbr': 'NYK',
    },
    {
      'rank': '6',
      'team': 'Los Angeles',
      'record': '52 - 30',
      'abbr': 'LAL',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NBA Team Rankings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // -----------------------------------------------------------------
          // EXPLANATION
          // -----------------------------------------------------------------

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'This horizontal ListView displays NBA team rankings. '
              'Because the ListView scrolls horizontally, its children '
              'receive an UNBOUNDED width constraint. LimitedBox gives '
              'each ranking card a maximum size.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------------
          // NBA TEAM RANKINGS
          // -----------------------------------------------------------------

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'NBA TEAM RANKINGS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _teams.length,
              itemBuilder: (context, index) {
                final team = _teams[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),

                  // ---------------------------------------------------------
                  // LIMITEDBOX
                  //
                  // maxWidth and maxHeight limit the child when the
                  // incoming constraint is unbounded.
                  // ---------------------------------------------------------

                  child: LimitedBox(
                    maxWidth: _maxWidth,
                    maxHeight: _maxHeight,

                    // Property 3: child
                    child: _useTeamLogo
                        ? _buildTeamCard(team)
                        : _buildSimpleRankingCard(team),
                  ),
                );
              },
            ),
          ),

          const Divider(height: 32),

          // -----------------------------------------------------------------
          // LIMITEDBOX CONTROLS
          // -----------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Live-adjust LimitedBox properties',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 12),

                // -----------------------------------------------------------
                // PROPERTY 1: maxWidth
                // -----------------------------------------------------------

                Text(
                  'maxWidth: ${_maxWidth.toStringAsFixed(0)} '
                  '(default: 100)',
                ),

                Slider(
                  value: _maxWidth,
                  min: 50,
                  max: 150,
                  divisions: 20,
                  label: _maxWidth.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      _maxWidth = value;
                    });
                  },
                ),

                const Text(
                  'Controls the maximum width of the child when '
                  'the incoming width is unbounded.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 12),

                // -----------------------------------------------------------
                // PROPERTY 2: maxHeight
                // -----------------------------------------------------------

                Text(
                  'maxHeight: ${_maxHeight.toStringAsFixed(0)} '
                  '(default: 100)',
                ),

                Slider(
                  value: _maxHeight,
                  min: 50,
                  max: 150,
                  divisions: 20,
                  label: _maxHeight.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      _maxHeight = value;
                    });
                  },
                ),

                const Text(
                  'Controls the maximum height of the child when '
                  'the incoming height is unbounded.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 12),

                // -----------------------------------------------------------
                // PROPERTY 3: child
                // -----------------------------------------------------------

                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'child: Team card vs. Ranking card',
                  ),
                  subtitle: const Text(
                    'Change the widget displayed inside LimitedBox.',
                  ),
                  value: _useTeamLogo,
                  onChanged: (value) {
                    setState(() {
                      _useTeamLogo = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------------------
  // TEAM CARD
  // -------------------------------------------------------------------------

  Widget _buildTeamCard(Map<String, String> team) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade400,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Text(
              team['abbr']!,
              style: TextStyle(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            '#${team['rank']}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),

          Text(
            team['team']!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            team['record']!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------------------
  // SIMPLE RANKING CARD
  // -------------------------------------------------------------------------

  Widget _buildSimpleRankingCard(Map<String, String> team) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.shade400,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '#${team['rank']}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            team['abbr']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            team['record']!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
