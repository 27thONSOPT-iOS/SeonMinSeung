# 👌 week3 lecture note  
> 지극히 personal notes, 제 기준에서 중요하고 신기했던 것들만 정리를 했습니당!  
> 참고로 저는 생코드로만 xcode 개발을 해왔어서 이런 스톨이볼드로 하는게 참으로 어려운 사람이라서 지극히 basic 한 내용들도 들어있을지도 몰라여 
> 제가 아래에 작성한 질문들에 대해 혹쉬 답을 아시는 분들은 공유해주시면 salang 합니당  

## 01 새로운 storyboard를 만들 때  
Info.plist를 설정해주어야 한당  

<img src="https://user-images.githubusercontent.com/37579661/97772418-34311200-1b8a-11eb-9c62-a027aa831ac0.png" width= 80%>

## 02 option키 활용  
option키로 확인하면서 auto layout 을 설정할 수 있는데, 이렇게 되면 safe area를 잘 볼 수 없다.  
  

## 03 ratio  
이미지 뷰같은 것은 '비율'을 맞추기 위해서   
<img src="https://user-images.githubusercontent.com/37579661/97772478-f08ad800-1b8a-11eb-9e78-420342179e81.png" width= 70%>
  
이렇게 ratio를 선택해주면 처리가 된다!    
<p float="left">

<img src = "https://user-images.githubusercontent.com/37579661/97772515-62fbb800-1b8b-11eb-86ef-c4ac7b73efd4.png" height="300">
  
<img src="https://user-images.githubusercontent.com/37579661/97772513-5e370400-1b8b-11eb-8054-d000d264d583.png" height = "300">
 </p>

그럼 미리 지정한 거리만큼이 위의 이미지 뷰와 오토레이아웃 처리가 된다!    
여기기까지만 하면... 오토레이아웃이 아직 다 설정이 되지 않았따고 뜨기 때문에  
  
아래와 같이 왼쪽 오른쪽도 처리해준다. (또다시 위의 이미지뷰와 연걸해서~~~)

## 04 autolayout 처리를 하는 다양한 방법  
1. control 누르고 원하는 것끼리 설정해주기    
<img src="https://user-images.githubusercontent.com/37579661/97772551-af46f800-1b8b-11eb-9ac0-2a13725df211.png" height = "300">

control을 누르고 pickerview --> safe area에 드랍을 하면  
<img src = "https://user-images.githubusercontent.com/37579661/97772604-064ccd00-1b8c-11eb-84b2-532d6330e085.png" height = "300">

이런 창에서 좌측과 우측을 맞출 수도 있다.   
<img src = "https://user-images.githubusercontent.com/37579661/97772613-19f83380-1b8c-11eb-9ae1-d812eb88a590.png" height = "100">

왼쪽, 오른쪽, 아래를 맞춰준당  
근데 이것은 그냥 이거랑 똑같은거당
2. 아래 버튼으로 auto layout 처리 해주기   
<img src = "https://user-images.githubusercontent.com/37579661/97772633-40b66a00-1b8c-11eb-85b9-46847eb17051.png> height = "300">

신기한 스토리보드의 세계~
생코드로 작성만 하다가 이런거 하니까 갱장히 짜증나면서도 아주 신세계당

## 05 nil값 처리  
![image](https://user-images.githubusercontent.com/37579661/97772761-4c566080-1b8d-11eb-8699-a20a0bf40010.png)

UIImage가 nil을 리턴하게 될 수도 있기 때문에!    
nil이 될 수도 있다고 말을 해주면 해결된당    
  
<img src = "https://user-images.githubusercontent.com/37579661/97772765-5f693080-1b8d-11eb-98d9-5f8cfc184c6c.png" height = "100">

요로케
  

## 06 UIPikcerViewDataSource!  

<img src="https://user-images.githubusercontent.com/37579661/97772869-4dd45880-1b8e-11eb-85fe-5268c60e0382.png" height = "300">

## 07 UIPickerViewDelegate  
<img src="https://user-images.githubusercontent.com/37579661/97772976-41043480-1b8f-11eb-8412-67c45661b9a7.png" height = "300">

titleforRow, 이러한 것들을 지정해줄 수 있따   
  
## 08 Table View  

<img src = "https://user-images.githubusercontent.com/37579661/97773612-adcdfd80-1b94-11eb-97fb-98806fdfb74e.png" height = "300">

오른쪽 위에 있는 prototype cells 에서 cell 개수 조정 가능하당  
근데 내가 보기에 그냥 코드로 설정해주는게 모두를 위해 편할듯 ㅋ  


## 09 두개의 label이 왼쪽 끝이 맞게 해주려면 ? 
  
<img src = "https://user-images.githubusercontent.com/37579661/97773876-d820ba80-1b96-11eb-8023-be285f841622.png" height = "200">
  
두개를 컨트롤로 연결하고 
**leading** 을 선택해주시면 된당!!   
<img src ="https://user-images.githubusercontent.com/37579661/97773887-e7a00380-1b96-11eb-8ab7-994327ac7d5c.png" height = "300">  

요로케   

## 10 Custom Cell 만들기  
  
<img src="https://user-images.githubusercontent.com/37579661/97773923-23d36400-1b97-11eb-9f38-8c83ed1c11c4.png" height = "300">

1000개의 셀을 만드는게 아니라 pull 안에서 어떠한 셀을 가져와야할지 알 수 있게 해주기 위해 **identifier를 지정**해준다. 
  
## 11 constrain to margins ? 
<img src="https://user-images.githubusercontent.com/37579661/97773746-bbd04e00-1b95-11eb-8be6-584fcebce9ff.png" height = "300">

완전 끝쪽 기준으로 오토레이아웃이 걸리는게 아니라 조금 마진을 두고 오토레이아웃이 걸리게 된당    
안좋다... 그냥 체크 안하는것이 좋다~~    


## 12 짤린다..?  
<img src = "https://user-images.githubusercontent.com/37579661/97774663-2a64da00-1b9d-11eb-8360-99ed597e3b3d.png" height = "300">
  
이렇게 짤리면 어떻게 하면 될까여어어ㅓ  
<img src = "https://user-images.githubusercontent.com/37579661/97774672-33ee4200-1b9d-11eb-93fe-d313d2d50d74.png" height = "300">

이런식으로 **sizeToFit()**을 활용한다!    


## 13 collectionView 
grid! 하나의 격자 형태로 세로 스크롤 뿐 만 아니라ㅏㅏ 가로도 가능하다!!    

esimate size ? none..? 왜징  
<img src="https://user-images.githubusercontent.com/37579661/97774808-63ea1500-1b9e-11eb-8620-f3f1e2f31649.png" height = "300">

  
## 14 trivia stuff. 그냥 내가 궁금한것들!  

### 1. weak 와 아닌것의 차이는 무엇일ㄲㅏ...?  

![image](https://user-images.githubusercontent.com/37579661/97772676-90953100-1b8c-11eb-8bf7-c8abb519d400.png)

### 2. foundation ? 
<img src ="https://user-images.githubusercontent.com/37579661/97772749-321c8280-1b8d-11eb-9b66-ebbe209ac45e.png" height = "100">


