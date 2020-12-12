import 'package:flutter/material.dart';

import '../../../models/works_model.dart';
import '../../../utils/size_config.dart';
import 'works_card.dart';

class WorksCardList extends StatelessWidget {
  final List<WorksModel> worksList = [
    WorksModel(
        name: '高端彩超',
        simpDesc: '这是一台高端推车式彩超, 外形美观, 功能齐全, 备受好评.',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/xbit90_02.jpg'),
    WorksModel(
        name: '中端彩超',
        simpDesc: '中端彩超, 苗条机身上, 完美整合了大屏+触屏+悬浮升降等功能',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/cbit9_01.jpg'),
    WorksModel(
        name: '无人机套装',
        simpDesc: '酷帅外形, 4K 1600W像素, 智能返航, GPS定位的专业高清无人机',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/drone_360qx.png'),
    WorksModel(
        name: '便携设备',
        simpDesc: '经典之作, 在关键的时期出现的关键之作, 托起公司发展的基石.',
        img: 'https://neoapp.oss-cn-shanghai.aliyuncs.com/q9_01.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth > 1080 ? getSize(1080) : getSize(1024),
      child: Wrap(
        spacing: getSize(10),
        alignment: WrapAlignment.spaceBetween,
        runSpacing: getSize(50),
        children: List.generate(
          worksList.length,
          (index) => WorksCard(
            works: worksList[index],
          ),
        ),
      ),
    );
  }
}
