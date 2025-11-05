import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/domain/entities/vehicle.dart';
import 'package:ride_hailing/domain/entities/vehicle_type.dart';
import 'package:ride_hailing/logic/provider/profile.dart';
import 'package:ride_hailing/logic/state/success_state.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_hailing/utils/toast.dart';
import 'package:ride_hailing/utils/utils.dart';

class DriverKycPage extends ConsumerStatefulWidget {
  final String? route;
  const DriverKycPage({super.key, this.route});

  @override
  ConsumerState<DriverKycPage> createState() => _DriverKycPageState();
}

class _DriverKycPageState extends ConsumerState<DriverKycPage> {
  TextEditingController? plateNumberController;
  TextEditingController? vehicleTypeController;
  TextEditingController? vehicleColorController;

  final ImagePicker imagePicker = ImagePicker();
  XFile? imageFile;
  File? file;
  String? filePath;

  final _formKey = GlobalKey<FormState>();

  final carTypeBox = Hive.box<VehiclesData>(HiveConst.vehicleDataBox);

  VehiclesData? selectedCarType;

  void pickImage() async {
    try {
      imageFile = await imagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        file = File(imageFile!.path);

        filePath = file!.path;
      });

      if (Platform.isAndroid) {
        retrieveLostData();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await imagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.image) {
        setState(() {
          file = File(response.file!.path);

          filePath = file!.path;
        });
      }
    }
  }

  @override
  void initState() {
    plateNumberController = TextEditingController();
    vehicleColorController = TextEditingController();
    vehicleTypeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    plateNumberController!.dispose();
    vehicleColorController!.dispose();
    vehicleTypeController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            arrowLeft,
            colorFilter: ColorFilter.mode(blackColor, BlendMode.srcIn),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Update Driver Profile",
          textAlign: TextAlign.center,
          style: normalTextRubik()
              .copyWith(color: blackColor, fontWeight: FontWeight.w300),
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.0.h,
                  ),
                  CustomTextField(
                    label: "Plate Number",
                    controller: plateNumberController,
                    textCapitalization: TextCapitalization.characters,
                    inputFormatters: [
                      UpperCaseTextFormatter(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in you plate number to continue';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25.0.h,
                  ),
                  ValueListenableBuilder(
                    valueListenable: carTypeBox.listenable(),
                    builder: (context, Box<VehiclesData> box, child) {
                      return CustomDropdownWidget(
                        list: box.values.toList(),
                        selectedValue: selectedCarType,
                        hintText: "Please select car type",
                        onChanged: (VehiclesData? value) {
                          setState(() {
                            selectedCarType = value;
                          });
                        },
                      );
                    },
                  ),
                  // CustomTextField(
                  //   label: "Vehicle Type",
                  //   hintText: "Toyota Matrix",
                  //   controller: vehicleTypeController,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please fill in you vehicle type to continue';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  SizedBox(
                    height: 25.0.h,
                  ),
                  CustomTextField(
                    label: "Vehicle Colour",
                    controller: vehicleColorController,
                    hintText: "Blue",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in you vehicle color to continue';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25.0.h,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    padding: const EdgeInsets.all(5),
                    color: lightBorderColor,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: filePath == null ? 100.0.h : 250.0.h,
                        width: double.infinity,
                        color: whiteColor1,
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: filePath == null
                                ? Center(
                                    child: Text(
                                      "Upload drivers license",
                                      textAlign: TextAlign.center,
                                      style: normalTextRubik()
                                          .copyWith(color: blackColor),
                                    ),
                                  )
                                : Image.file(
                                    File(filePath!),
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  30.0.verticalSpace,
                  ref.watch(registerVehicleProvider).isLoading
                      ? CustomLoadingButtonBack(
                          size: size,
                          onTap: () {},
                          text: "Update",
                        )
                      : CustomButton(
                          size: size,
                          onTap: () {
                            if (file == null) {
                              showToast("Upload Driver's license to continue");
                            } else {
                              if (_formKey.currentState!.validate()) {
                                if (selectedCarType == null) {
                                  showToast(
                                      "Select a vehicle type to continue");
                                } else {
                                  ref
                                      .watch(registerVehicleProvider.notifier)
                                      .registerVehicle(
                                          plateNumber:
                                              plateNumberController!.text,
                                          vehicleType:
                                              selectedCarType!.id.toString(),
                                          vehicleColor:
                                              vehicleColorController!.text,
                                          licenceFile: file!,
                                          fileName: "Driver's License",
                                          context: context);
                                }
                              }
                            }
                          },
                          text: "Update",
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
