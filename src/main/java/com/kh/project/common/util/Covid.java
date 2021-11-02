package com.kh.project.common.util;

//1025 윤인규 코로나 현황 5일치 조회 구현중
//정상적으로 xml에서 데이터를 들고 오는 것 확인함.
//이걸 jsp로 어떻게 넘김??

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Covid {
	//public static void getCovidXmlData() {
	public static void main(String[] args) {
		try {
			//코로나 api url 가져오기
			String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?"
					+ "&serviceKey=mYPJwNWXuMeFWu0Ba2h30gPHDrvr%2B64p%2BRo9uyusbkG6aG7%2B0Z8dpUSHDWzuMiq65vl7invgpLPlkiW%2FGX%2FrvA%3D%3D"
					+ "&startCreateDt=" + CurrentDateTime.firstDay() 
					+ "endCreateDt=" + CurrentDateTime.today();
			
			// 1. 빌더 팩토리 생성.
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			
			// 2. 빌더 팩토리로부터 빌더 생성
			DocumentBuilder builder = builderFactory.newDocumentBuilder();
			
			// 3. 빌더를 통해 XML 문서를 파싱해서 Document 객체로 가져온다.
			Document document = builder.parse(url);
			
			// 문서 구조 안정화 ?
			document.getDocumentElement().normalize();
			
			// XML 데이터 중 <item> 태그에 접근
			NodeList itemList = document.getElementsByTagName("item");
			
			// <item> 태그 리스트를 하나씩 돌면서 값들을 가져온다.
			for (int i = 0; i < itemList.getLength(); i++) {
				Node covidNode = itemList.item(i);
				
				if(covidNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) covidNode;
					
					//getTagValue라는 메소드는 아래 있으며, 해당 메소드로 itemList에 각각 필요 데이터 조회(syso)하고 저장
					System.out.println("------------------------------");
					System.out.println("날짜 : " + getTagValue("createDt", eElement));
					System.out.println("확진자 수 : " + getTagValue("decideCnt", eElement));
					System.out.println("사망자  수 : " + getTagValue("deathCnt", eElement));
					System.out.println("치료중 환자 수 : " + getTagValue("careCnt", eElement));
					System.out.println("격리해제  수 : " + getTagValue("clearCnt", eElement));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static String getTagValue(String tag, Element eElement) {
		NodeList itemList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) itemList.item(0);
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
}
