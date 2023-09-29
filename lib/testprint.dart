import 'dart:developer';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'printerenum.dart';

// String generateZPLFromText(String text,
//     {TextAlign alignment = TextAlign.left}) {
//   String alignCode = '';
//   switch (alignment) {
//     case TextAlign.center:
//       alignCode = '^FB380,1,0,C';
//       break;
//     case TextAlign.right:
//       alignCode = '^FB380,1,0,R';
//       break;
//     default:
//       alignCode = '^FB380,1,0,L';
//   }

//   return '^XA\n' // Inicio de etiqueta ZPL
//       '^POI\n' // Establece la orientación de impresión como inversa
//       '^FO20,20^A0N,25,25$alignCode^FD$text^FS\n' // Coloca el texto con la alineación especificada
//       '^POE\n' // Restablece la orientación de impresión a la normal
//       '^XZ'; // Fin de etiqueta ZPL
// }

String generateZPLFromText(String text,
    {TextAlign alignment = TextAlign.left}) {
  String alignCode = '';
  switch (alignment) {
    case TextAlign.center:
      alignCode = '^FB340,1,0,C';
      break;
    case TextAlign.right:
      alignCode = '^FB360,1,0,R';
      break;
    default:
      alignCode = '^FB340,1,0,L';
  }

  return '^XA\n' // Inicio de etiqueta ZPL
      '^POI\n' // Establece la orientación de impresión como inversa
      '^FO20,20^A0N,25,25$alignCode^FD$text^FS\n' // Coloca el texto con la alineación especificada
      '^POE\n' // Restablece la orientación de impresión a la normal
      '^XZ'; // Fin de etiqueta ZPL
}

class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  sample() async {
    bool? isConnected = await bluetooth.isConnected;
    if (isConnected != true) {
      return;
    }
    // bluetooth.write("^XA^LH0,0^CF0,30,30^FO50,50^FDDISLACVTA SA DE CV.^FS^FO50,100^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS^FO50,140^FDPuerto Vallarta, Jalisco^FS^FO50,180^FDventas@dislac.com.mx^FS^FO50,220^FDTel.: 322 290 1396^FS^FO50,260^FDTel.: 322 290 2252^FS^FO50,300^GB900,5,3^FS^FO50,320^FDJohn Doe^FS^FO50,360^FD100 Main Street^FS^FO50,400^FDSpringfield, TN 39021^FS^FO50,440^FDUnited States (USA)^FS^FO50,480^FDPedido^FS^FO50,520^GB900,5,3^FS^FO50,540^FDDescripcion del producto se colocara aqui^FS^FO50,580^FDCant.^FS^FO290,580^FDPrecio^FS^FO399,580^FDImporte^FS^FO50,620^FD100^FS^FO290,620^FD10000^FS^FO399,620^FD10000^FS^FO300,700^FDImporte^FS^FO399,700^FD10000^FS^XZ");
    bluetooth.write("""
^XA
^LL600
^CF0,20,20
^FO50,50^FDDISLACVTA SA DE CV.^FS
^FO50,100^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,130^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,160^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,190^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,210^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,240^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,270^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,300^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,330^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,360^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,390^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,410^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,440^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^FO50,1000^FDCalle Sinaloa 374, Las Mojoneras, C.P. 48290^FS
^XZ
""");
  }
}
