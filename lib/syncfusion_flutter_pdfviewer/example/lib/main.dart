import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


void main() {
  runApp(MaterialApp(
    title: 'Syncfusion PDF Viewer Demo',
    home: HomePage(),
  ));
}

/// Represents Homepage for Navigation
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewerTheme(
        data: SfPdfViewerThemeData(
          backgroundColor: Color(0xFF2C2C2C),
          progressBarColor: Colors.amber,

        ),
        child: SfPdfViewer.network(
          'https://storage.yandexcloud.net/worldoffantasy/maket.pdf',
          key: _pdfViewerKey,
          canShowScrollHead: false,
          canShowPageLoadingIndicator: false,
          scrollDirection: PdfScrollDirection.horizontal,
          pageLayoutMode: PdfPageLayoutMode.single,
          canShowSignaturePadDialog: false,
        ),
      ),
    );
  }
}
