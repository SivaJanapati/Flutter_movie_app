import 'package:flutter/material.dart';
import 'package:movie/Widgets/toprated.dart';
import 'package:movie/Widgets/trending.dart';
import 'package:movie/Widgets/tv.dart';
import 'package:movie/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        brightness: Brightness.dark,
        useMaterial3: true,
        primaryColor: Colors.green,
      ),
      home: const MyHomePage(title: 'CHITRALU'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingMovies = [];
  List topratedmovies = [];
  List tvMovies = [];

  final String apiKey = '62de91f04546069127bbf29b21928e1c';
  final readaccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MmRlOTFmMDQ1NDYwNjkxMjdiYmYyOWIyMTkyOGUxYyIsIm5iZiI6MTcyMzc4NzIxOS4yMjM2MTEsInN1YiI6IjY2Yjk1MTMxMDMwMmNlY2MzM2JkYTQ4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B29T6XqYsh4Ez54qj2n2hcvJ0tZBplx7pIZvALdlV_E';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccessToken),
        logConfig: ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    print(trendingresult);

    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tvMovies = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(text: "CHITRALUU", color: Colors.purple, size: 25),
      ),
      body: ListView(
        children: [
          TV(tv: tvMovies),
          TrendingMovies(trending: trendingMovies),
          TopRated(toprated: topratedmovies),
        ],
      ),
    );
  }
}
