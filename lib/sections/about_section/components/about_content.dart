import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';

class AboutContent extends StatelessWidget {
  final String content = '''
彭(Neo Peng)先生有20年的工作经历, 其中大部分时间是在技术部门工作, 特别是在产品设计一线有超过15年的设计和管理经验. 

彭先生熟悉产品设计研发流程, 能与硬件团队深入沟通, 提供良好改善建议. 同时熟悉产品结构设计, 特别是塑胶、压铸、钣金等设计及技巧, 熟悉注塑、压铸模具加工过程及模具问题分析, 熟悉产品常用后处理方式. 

彭先生在专业领域经验丰富, 精通使用Pro/E和AutoCAD等设计软件,  同时能带领团队克难攻坚, 能主导产品全流程节奏, 在业务上能做表率, 能给团队带来积极向上的氛围.

设计生涯中, 彭先生为雇主做了不少建树. 设计的几个产品大多成为公司主流机型, 取得若干发明和实用新型专利, CMEF展会最受欢迎奖, 2017年度无锡科技进度奖等. 2019年底上市敲钟的机型就是彭先生主导设计的XBit系列.

感谢您的浏览, 希望有机会为您带来更好的设计和体验, 为您助力!
  ''';
  final TextStyle style = TextStyle(
    fontSize: getSize(18),
    letterSpacing: 1.2,
    height: 1.5,
  );

  final List<String> imgUrls = [
    'https://neoapp.oss-cn-shanghai.aliyuncs.com/invent_certificate.png',
    'https://neoapp.oss-cn-shanghai.aliyuncs.com/cmef_award.jpg',
    'https://neoapp.oss-cn-shanghai.aliyuncs.com/stock_showcase.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getSize(50)),
      margin: EdgeInsets.symmetric(vertical: getSize(50)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(getSize(10), getSize(10)),
            blurRadius: getSize(20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(content, style: style),
          SizedBox(height: getSize(30)),
          Wrap(
            direction: Axis.horizontal,
            spacing: getSize(20),
            runSpacing: getSize(20),
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.center,
            children: List.generate(
              imgUrls.length,
              (index) => Container(
                width: getSize(300),
                height: getSize(250),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgUrls[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(getSize(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(getSize(5), getSize(5)),
                      blurRadius: getSize(8),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
