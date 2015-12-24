CardHeroes
==========

Simple TCG.

Using GPL v3 License

Game Part and Dictionary Part.

game part -> for game. viewcontroller, view, models
dictionary(data) part -> for dictionary

using ios's basic things

CardHeroes

iPhone5, iPad Air에 최적화.

개요

프로그램 제작 계기
 2014년 초 하스스톤, Might and Magic : Duel Of Champions등의 Trading Card Game를 즐겨 했었다. 각 카드에 체력과 공격력이 있고 자신의 카드와 상대방의 카드가 대결을 하여서 점수가 계산되는 방식의 게임이다. 이런 게임을 즐겨하던 기억에다가 이번 학기 모바일 프로그래밍 과목에서 만들어본 Matchismo예제를 하면서 CardHeroes를 만들기로 하였다.
 

프로그램 개략적 설명
 Matchismo에서 사용된 개념들에 TCG적인 요소를 결합 하였다.
 각 플레이어는 7장의 카드를 가지며 각 카드에는 능력치 (체력, 공격력)이 존재한다.
 플레이어가 카드를 선택하고 공격하려는 상대방의 카드를 지정하고 공격명령을 내리면 상대방의 카드를 공격하게 되고 보편적인 TCG게임에서 처럼 상대방의 공격력만큼 반격받게 된다.
공격할 상대방을 지정하는 대신에 플레이어마다 지정된 특수능력을 사용할 수 있다.
 그리고 부록개념으로 게임에 나오는 캐릭터들과 기타사항등을 다루는 Dictionary를 구현하였다.
 
  크게 본 게임을 담당하는 Game부분과 Dictionary를 다루는 Data부분으로 나뉜다.
 Dictionary는 TableView를 사용하였기 때문에 Table에 대한 View와 Cell에 대한 View를 작성하였다.
 Game 부분의 View는 캐릭터 선택 메뉴 및 본 게임에 대한 View 이다. 
Game의 모델은 각 카드에 대한 모델 CardModel → 총 카드들의 모임들을 다루는 DeckModel → 각 플레이어를 다루는 PlayerModel → 게임 진행을 다루는 GameModel이 있다.
Dictionary의 모델은 데이터셋에 해당하는 Data, 데이터 셋을 초기화 하고 내용들을 저장하는 DataDataController이 있다.

ipad의 storyboard

Game부분의 모델에 대한 설명

CardModel.h/CardModel.h
각 카드에 대한 내용을 저장.
@property (nonatomic, assign) NSInteger unitHealth; //카드의 초기 체력치
@property (nonatomic, assign) NSInteger unitHealthNow; // 카드의 현재 체력치
@property (nonatomic, assign) NSInteger unitAttack; //카드의 공격력
@property (nonatomic, assign) NSInteger unitTier; //카드의 레벨
@property (strong, nonatomic) NSString* unitName; //카드의 이름
@property (nonatomic, assign) NSInteger playerNum;//카드가 속한 플레이어
@property (strong,nonatomic) NSString * imgNum; //카드 이미지 번호

DeckModel.h/DeckModel.m
카드의 모임(덱)에 관한 내용.
@property (strong,nonatomic) NSMutableArray *cards; //플레이어의 카드 모임(7장)을 나타내는 배열
-(instancetype)init:(NSInteger)num //플레이어 캐릭터 타입에 따라 카드를 정의하고 덱 배열에 삽입하는등의 초기화를 진행.

PlayerModel.h/PlayerModel.m
@property (strong, nonatomic) NSString* playerName; //플레이어가 선택한 캐릭터의 이름
@property (strong, nonatomic) NSString* playerPortrait; //플레이어가 선택한 캐릭터의 초상화
@property (nonatomic, assign) NSInteger playerNum; //캐릭터 고유 번호
@property (strong, nonatomic) DeckModel *playerDeck; //플레이어의 카드덱
-(instancetype)playerInit:(NSInteger)playNum//플레이어의 고유번호가 정해지면 이를 바탕으로 플레이어의 덱을 불러와서 초기화.

GameModel.h/GameModel.m
@property (strong,nonatomic) PlayerModel *myModel; //플레이어 본인의 플레이어 모델.
@property (strong, nonatomic) PlayerModel *enModel; //상대방의 플레이어 모델
@property (strong,nonatomic) NSString *gameName; //특수한경우 이번 게임의 이름이 정해진다.
@property (nonatomic, assign)NSInteger mySelect; //현재 선택한 플레이어의 카드번호
@property (nonatomic, assign)NSInteger enSelect; //현재 선택한 상대방의 카드번호
@property (nonatomic, assign)NSInteger myAvilCnt;//플레이어의 남은 특수능력수
@property (nonatomic, assign)NSInteger enAvilCnt;//상대방의 남은 특수능력수
@property (strong, nonatomic) NSString *recentAction; //이번 턴에 일어난 일을 기록하는 로그.
-(instancetype)gameInit:(NSInteger)myNum enemy:(NSInteger)enNum //플레이어 캐릭터의 고유번호와 상대방 캐릭터의 고유번호를 통해 게임을 초기화 시킨다.
-(NSInteger)attackProcess//플레이어가 공격을 지시할때의 프로세스
-(NSInteger)avilityProcess//플레이어가 특수능력을 사용할 때의 프로세스

Dictionary(Data)부분의 모델 설명
Data.h/Data.h
@property (nonatomic, copy) NSString *title;//항목 제목
@property (nonatomic, copy) NSString *summary;//항목의 부제목
@property (nonatomic, copy) NSString *imgName; //항목을 나타내는 그림
@property (nonatomic, copy) NSString *content;//항목의 설명
@property (nonatomic, copy) NSString *type; //항목 분류
-(id)initWithTitle:(NSString *)title summary:(NSString *)summary campId:(NSString*)campID imgName:(NSString *)imgName content:(NSString *)content type:(NSString *)type;
//항목을 초기화 하여 내용을 집어 넣는다.

DataDataController.h/DataDataController.m
- (NSUInteger)DataCount; //데이터의 총 갯수
- (Data *)DataAtIndex:(NSUInteger)index; //현재 선택된 데이터의 내용을 반환한다.
- (void)addDataWithTitle:(NSString *)title summary:(NSString *)summary campId:(NSString*)campId imgName:(NSString *)imgName content:(NSString *)content type:(NSString *)type; //데이터 모음을 초기화 한다.
@property (nonatomic, readonly) NSMutableArray *DataList; //데이터들을 담는 배열.

뷰 컨트롤러에 대한 설명

ViewController.h/ViewController.m
캐릭터 선택화면에 관한 뷰 컨트롤러
GameViewController.h/GameViewController.m
게임화면에 대한 뷰 컨트롤러
DataViewController.h/DataViewController.m
데이터 선택을 하는 TableView에 관한 뷰 컨트롤러
DataTableViewCell.h/DataTableViewCell.m
TableView에서 각 Cell에 관한 뷰 컨트롤러
DataDetailViewController.h/DataDetailViewController.m
선택된 데이터를 보여주는 화면에 대한 뷰 컨트롤러

 
