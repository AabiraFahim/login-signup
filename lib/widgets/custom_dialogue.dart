import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/constant.dart';

customDialogue({required BuildContext context, required String title, required String bodyText,}){
  showDialog(
      barrierDismissible: false,
      //barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (_) =>
          AlertDialog(
            backgroundColor: kBackgroundColor,
            insetPadding:const EdgeInsets.symmetric(horizontal: 20),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(
                    Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return SizedBox(
                  // width: MediaQuery.of(context).size.width/1.1,
                  // height: MediaQuery.of(context).size.height/boxHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: ()=>Navigator.pop(context),
                          child: const Align(
                              alignment:Alignment.centerRight,
                              child: Icon(Icons.close,color: Colors.white,))),
                      Row(
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        thickness: 0.7,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        bodyText,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
  );
}