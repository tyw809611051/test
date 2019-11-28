import 'package:flutter/material.dart';
/**
 * @description: 用户协议页
 * @author: YiWen
 * @date: 2019-11-28 11:04:00
 * @version V1.0.0 
 */

class AgreementPage extends StatelessWidget {
  const AgreementPage({Key key}) : super(key: key);
  final String topBlackSpace = "    ";
  final String secondBlackSpace = "          ";
  final String thirdBlackSpace = "            ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("蜂鸟云测用户协议", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "蜂鸟云测用户协议",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("提示条款：", style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 3),
                    child: Text(
                      "${topBlackSpace}《蜂鸟云测平台用户协议》（以下简称协议）由国科赛思（北京）科技有限公司（以下简称赛思库）与需求用户（以下简称用户）签订，有助于用户了解国科赛思为用户提供的服务内容及用户使用服务的权利和义务。为维护用户自身权益，请用户仔细阅读（特别是以粗体标注的内容）、充分理解各条款内容，其中各条款前所列索引关键词仅为帮助用户理解该条款表达的主旨之用，不影响或限制协议条款的含义或解释。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Text(
                    "${topBlackSpace}如果用户对协议内容有疑问，用户可通过https://www.cisslab.com/的在线客服或客服电话：010-82745680进行咨询。如果用户不同意协议或其中任何条款约定，用户应立即停止委托。当用户阅读协议且完成委托提交后，即表示用户已充分阅读、理解并接受协议的全部内容。",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("一、定义",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（一）本协议：除另行明确声明外，任何使服务范围扩大或功能增强的新内容均受本协议约束。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（二）Cisslab.com（蜂鸟云测）：由国科赛思提供元器件检测服务、方案服务和采购服务的在线平台网站，网址为https://www.cisslab.com/（此URL可由国科赛思根据业务需要不时修改）。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（三）蜂鸟云测平台规则：国科赛思已经发布及后续发布的全部的与产品、服务、技术、费用、法律声明及隐私权政策、知识产权、保密、违约、争议解决等内容相关的规则、解读、实施细则、说明、公告等或与用户另行签订书面补充协议等；赛思库平台规则为协议不可分割的一部分，与协议正文具有同等法律效力。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（四）用户：即发布需求用户，是指在蜂鸟云测平台上发布需求的机构或个人。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace} (五）账户：即用户完成注册流程而获得的其将在使用服务的过程中必须与自设的账户密码共同使用的用户名，又称“蜂鸟云测账户”。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("二、协议的效力",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（一）用户签署或在线接受本协议时，本协议生效。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（二）国科赛思可根据国家法律法规变化及维护需求发布秩序、保护用户的消费者权益需要，不时修改本协议（以下简称变更事项）并通过https://www.cissdata.com予以公布。如用户不同意变更事项，用户有权在变更事项确定的生效日前联系国科赛思并提出书面的反馈意见。如书面的反馈意见得以采纳，国科赛思将酌情调整变更事项。如用户对调整后变更事项仍不同意的，用户应当于调整后的变更事项确定的生效之日起停止使用赛思库平台，调整后的变更事项对用户不产生效力；如用户在调整后的变更事项生效后仍继续使用蜂鸟云测平台，则视为用户同意已生效的调整后的变更事项。",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("三、账户注册",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（一）账户申请条件",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Text(
                    "${secondBlackSpace}1.用户注册蜂鸟云测账户时，应当是根据用户住所地法律规定合法设立的、持续存在的公司、企业等非自然人组织、机构。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}2.用户不是任何国家、国际组织或者地域实施的贸易限制、制裁或其他法律、规则限制的对象。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}3.用户的经营范围符合中华人民共和国及用户住所地国家、地区法律的规定，不存在违反中华人民共和国及用户住所地法律法规规定的情况。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}4.用户指定具有的签署本协议的民事行为能力的自然人（以下简称授权代表）代为签订本协议以及处理与本协议相关的全部事宜。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}5.用户或授权代表应拥有如下设备并可承担如下开支：",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${thirdBlackSpace}（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${thirdBlackSpace}（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}6.承诺接受并遵守本协议的约定。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（二）账户的获取",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Text(
                    "${secondBlackSpace} 1.用户联系客服开通企业管理员账号，用户需要提供“姓名“、“手机号“、”公司名称“等信息，平台客服在2小时内开通账号。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Container(
                    child: Text(
                      "${topBlackSpace}（三）账户的使用",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Text(
                    "${secondBlackSpace}1.用户及可以通过账户名及初始密码登录蜂鸟云测平台后，可享受本协议项下的服务并根据蜂鸟云测平台规定改变用户的密码。",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("四、赛思库平台的使用",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "${topBlackSpace}（一）需求发布",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}1.用户通过蜂鸟云测平台提交委托单，包括但不限于名称、型号、数量、封装以及用户信息，因信息虚假或存在问题引起的一切问题均有用户自行承担。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${topBlackSpace}（二）服务实施",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}1.平台在15分钟内对用户委托单进行审核，审核通过即开始服务。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}2.用户可实时在线查看服务进展。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}3.服务完成后用户和国科赛思线下结算。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}4.自用户同意委托之日起，委托单生效，该委托单视为用户与需方用户的合同并具有法律效力。",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("五、用户的承诺与保证",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "${topBlackSpace}（一）用户承诺在本协议有效期内无以下行为：",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${secondBlackSpace}1.传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}2.从中国大陆向境外传输资料信息时违反中华人民共和国（不含港澳台地区）有关法规；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}3.利用蜂鸟云测平台从事洗钱、窃取商业秘密、窃取个人信息等违法犯罪活动；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}4.干扰蜂鸟云测平台的正常运转，包括但不限于侵入蜂鸟云测平台及国家计算机信息系统；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}5.传输或发表任何违法犯罪的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽的、不文明的等信息资料；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}6.传输或发表损害国家社会公共利益和涉及国家安全的信息资料或言论；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}7.教唆他人从事赛思库平台所禁止的行为；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}8.发布任何侵犯他人著作权、商标权等知识产权或合法权利的内容。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}若违反上述承诺，给平台或其他用户带来损失或不良影响的，平台有权停止、解除本协议，并要求其赔偿因此带来的全部损失。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${topBlackSpace}（二）用户保证在本协议有效期内：",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${secondBlackSpace}1.遵守中华人民共和国法律法规的规定；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}2.其有合法的权利缔结本协议、使用国科赛思提供的服务；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}3.遵守诚实信用原则，确保提交给蜂鸟云测平台的信息真实，并在交易过程中切实履行用户的承诺；",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}4.对其在蜂鸟云测平台上的言论和行为承担法律责任",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}5.不对蜂鸟云测平台的任何数据进行商务利用，包括但不限于在未经国科赛思事先书面批准的情况下、以任何方式使用蜂鸟云测平台数据。若违反上述承诺，给平台或其他用户带来损失或不良影响的，平台有权停止、解除本协议，并按平台相关要求赔偿因此带来的全部损失。",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("六、国科赛思的权利和义务",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "${topBlackSpace}（一）权利",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${secondBlackSpace}1.有权使用或抓取用户的注册信息、用户名、密码等信息，登录进入用户的注册账户，进行证据保全，调解纠纷，包括但不限于公证、见证等。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}2.用户违反本协议约定或者法律规定的，国科赛思有权作出独立判断并采取暂停或关闭用户的蜂鸟云测平台等措施。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}3.国科赛思在提前30天以网站公告的形式通知用户后，有权根据业务调整情况将本协议项下的全部权利义务一并转移给其关联公司，若有异议，应在公示期内与平台联系协商。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}4.国科赛思有权不时地对协议及蜂鸟云测平台的内容进行修改，并在蜂鸟云测平台公示，无须另行通知用户。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}5.国科赛思在法律允许的最大限度范围内对本协议及蜂鸟云测平台内容拥有解释权。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${topBlackSpace}（二）义务",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${secondBlackSpace}1.国科赛思有义务在现有技术上维护整个蜂鸟云测平台的正常运行，并努力提升和改进技术，使用户网上交易活动得以顺利进行。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}2.对用户在注册和使用服务中所遇到的与交易或注册有关的问题及反映的情况，国科赛思应及时作出回复。",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("七、保密条款",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "${topBlackSpace}（一）本协议所称商业秘密包括但不限于本协议、任何补充协议所述内容及在合作过程中涉及的其他秘密信息。",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${secondBlackSpace}1.任何一方未经商业秘密提供方同意，均不得将该信息向任何第三方披露、传播、编辑或展示。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${secondBlackSpace}2.协议各方承诺，本协议终止后仍承担此条款下的保密义务，保密期将另行持续三年。",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${topBlackSpace}（二）因对方书面同意以及国家行政、司法强制行为而披露商业秘密的，披露方不承担责任；该商业秘密已为公众所知悉的，披露方不承担责任。",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
