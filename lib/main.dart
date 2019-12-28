import 'package:flutter/material.dart';


import 'package:flutter/services.dart';
import 'package:qr_utils/qr_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {	
	GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

	@override
	void initState() {
		super.initState();
	}

	List<String> _qrCodes = [];

	Widget _addTileLists({String qrCode=""}) {
		if(qrCode!="" && qrCode!=null) _qrCodes.add(qrCode);

		return ListView.builder(
			itemCount: _qrCodes.length,
			itemBuilder: (context, index) {
				return Card(
					key: Key("Key"),
					child: ListTile(
						leading: Icon(Icons.camera_alt),
						title: Text(_qrCodes[index]),
						/* trailing: Icon(
							Icons.edit,
							color: Colors.transparent,
						), */
						onLongPress: () {
							setState(() {
								_qrCodes.remove(index);
							});
						}
					),
				);
			},
		);
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(primarySwatch: Colors.teal),
			home: Scaffold(
				key: _scaffoldKey,
				backgroundColor: Colors.grey[700],
				floatingActionButton: FloatingActionButton(
					onPressed: _scanQR,
					child: Icon(Icons.camera_enhance),
				),
				appBar: AppBar(
					title: const Text('Eczane Mobil İlaç Barkod Tarayıcı'),
				),
				
				body: _addTileLists()
			),
		);
	}

	void _scanQR() 
		async {
			String result;
			try {
				result = await QrUtils.scanQR;
			} on PlatformException {
				result = "Platform error";
			}

			setState(() {
				if(!_qrCodes.contains(result)) {
					_addTileLists(qrCode: result);

					if(_qrCodes.contains(result)){
						Fluttertoast.showToast(
							msg: "$result ilacı eklendi",
							toastLength: Toast.LENGTH_SHORT,
							gravity: ToastGravity.BOTTOM,
							timeInSecForIos: 1,
							backgroundColor: Colors.teal.withOpacity(0.5),
							textColor: Colors.white,
							fontSize: 14.0
						);
					}
					else if(_qrCodes.contains(result)){
							Fluttertoast.showToast(
							msg: "$result ilac zaten eklenmiş",
							toastLength: Toast.LENGTH_SHORT,
							gravity: ToastGravity.BOTTOM,
							timeInSecForIos: 1,
							backgroundColor: Colors.redAccent[400].withOpacity(0.5),
							textColor: Colors.white,
							fontSize: 14.0
						);
					}	
				}
			});
		}
}