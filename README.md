# WineManagement
sql개인프로젝트

구현한 기능(입력 및 포도농장 관리)
• 새로운 밭 등록 ---FIELD_INSERT_NEW.jsp(정보들 입력), FIELD_RESULT_NEW.jsp(데이터베이스에 등록)
• 새로운 포도농장 등록 ---VINEYARD_INSERT.jsp(정보들 입력), VINEYARD_RESULT.jsp(데이터베이스에 등록)
• 새로운 와인 양조장 등록-거래 가능한 포도농장 목록 표출/선택 ---WINERY_INSERT.jsp(정보들 입력), WINERY_RESULT.jsp(데이터베이스에 등록)
• 웹에서 와인 종류 테이블 및 와인 등급 테이블 정보 등록 ---INSERT_INFO_OF_WINE_GRADE_N_CATEGORY.jsp(등록되어있지 않다면 등록시킴)
• 포도농장 목록 출력 ---SHOW_VINEYARD_LIST.jsp(포도농장 목록과 주인, 전화번호, 주소 출력)
• 포도농장 상세정보 출력 ---SHOW_VINEYARD_INFO.jsp(자금과 포도 재고량 등 상세목록 출력)
• 포도농장 정보 수정 ---EDIT_VINEYARD_INFO.jsp(수정할 정보들 입력), EDIT_VINEYARD_INFO_RESULT.jsp(입력 정보 데이터베이스에 업데이트)
• 밭 목록 출력 ---SHOW_FIELD_LIST.jsp(밭 목록 출력)
• 밭 상세정보 출력 ---SHOW_FIELD_INFO.jsp(id, 주소, 면적, 재배품종 등 상세정보 출력)
• 밭 정보 수정 ---EDIT_FIELD_INFO.jsp(수정할 정보들 입력받음), EDIT_FIELD_INFO_RESULT.jsp(입력 정보 데이터베이스에 업데이트)
• 포도 생산 ---PRODUCE_GRAPE_FROM_FIELD.jsp(생산할 포도 개수 지정), PRODUCE_GRAPE_FROM_FIELD_RESULT.jsp(데이터베이스에
업데이트)

구현한 기능(와이너리 관리)
• 와이너리 목록 출력 ---SHOW_WINERY_LIST.jsp(와이너리 목록 출력---통계정보 출력은 구현X)
• 와이너리 상세정보 출력 ---SHOW_WINERY_INFO.jsp(포도 재고량, 자금 및 아래의 생산량, 판매량, 목록들 출력)
• 와인 재고량, 생산량, 판매량 출력 ---SHOW_WINERY_INFO.jsp
• 와인 생산 목록 출력 ---SHOW_WINERY_INFO.jsp
• 와인 판매 목록 출력 ---SHOW_WINERY_INFO.jsp
• 와이너리 정보수정 ---EDIT_WINERY_INFO.jsp(수정할 정보들 입력), EDIT_WINERY_INFO_RESULT.jsp(입력 정보 데이터베이스에 업데이트)
• 포도 구매 ---PURCHACE_GRAPE.jsp(종류별 구매희망수량 입력), PURCHACE_GRAPE_RESULT.jsp(구매정보 및 자금, 저장량 최신화)
• 와인 생산 및 생산정보 추가 ---PRODUCE_WINE.jsp(종류 및 생산량 입력), PRODUCE_WINE_RESULT.jsp(생산정보 및 자금, 저장량, 생산량
최신화)
• 와인 판매 및 판매정보 추가 ---SELL_WINE.jsp(판매할 종류 및 수량 입력), SELL_WINE_RESULT.jsp(판매정보 및 자금, 저장량 최신화)

구현한 기능에 대한 간단한 설명
대부분을 입.출력/ db에 등록 이 두 페이지로 역할을 나눠서 구현.
먼저 입.출력 부분에서는 입력에 필요한 정보들을 받아와서 출력을 해주고 수정할 정보들을 입력 받음. 이곳에서 html을 통해 약간의 제약조건들을 검사.
이후 db에 등록부분으로 정보를 넘겨주면 중복되면 안되는 정보들(id 등등) 혹은 구매 및 판매의 경우 돈이나 재고가 –가 되지 않는지 등등을 검사.
테이블을 만들며 제약조건을 적었으나 이곳에서 처리하면서 alert를 통해 입력하면 안되는 조건이 있다면 그 전 페이지로 넘어가서 처리를 할 수 있게 하고싶어서 이렇게 만듦.

