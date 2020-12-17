import 'package:flutter/material.dart';

import '../../../models/service_model.dart';
import '../../../utils/size_config.dart';
import 'service_item_card.dart';

class ServiceItemCardList extends StatelessWidget {
  final List<ServiceModel> serviceModels = [
    ServiceModel(
        serviceName: '软件开发',
        color: Colors.amber[200],
        serviceIcon:
            'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_file_sync_ot38.png'),
    // ServiceModel(
    //     serviceName: '工业设计',
    //     color: Colors.lightGreen[200],
    //     serviceIcon:
    //         'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_lightbulb_moment_evxr.png'),
    ServiceModel(
        serviceName: '结构设计',
        color: Colors.orange[200],
        serviceIcon:
            'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_drone_surveillance_kjjg.png'),
    ServiceModel(
        serviceName: '供业链服务',
        color: Colors.cyan[200],
        serviceIcon:
            'https://neoapp.oss-cn-shanghai.aliyuncs.com/undraw_factory_dy0a.png'),
  ];
  @override
  Widget build(BuildContext context) {
    double width =
        SizeConfig.screenWidth > getSize(1080) ? getSize(1080) : getSize(1024);
    double spacing = (width - getSize(240) * 4) / 3;
    return Wrap(
      spacing: spacing, //getSize(10),
      runSpacing: getSize(10),
      alignment: WrapAlignment.start,
      children: List.generate(serviceModels.length,
          (index) => ServiceItemCard(serviceModel: serviceModels[index])),
    );
  }
}
