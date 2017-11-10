class AskedController < ApplicationController
  def index
    @question = Asked.all #Asked에서 모든 데이터를 받아온다.
  end
 
  def show
   #파라미터 받아오는 것.
   @name = params[:name]
   @question=params[:question]
   Asked.create(
     name: @name,
     question: @question
     )
     redirect_to :back #뒤로 돌아가라
     
  # @askedcontent = params[:content]
  #   @anamechoice = params[:namechoice]
  #   @name = "익명"
  #   if params[:namechoice] == "realname"
  #     @name = params[:askername]
  #   end
  # if @anamechoice = params[:realname]
  #   puts @anamechoice
  # end  
  end
  
  
  def sign_up
  end 
 
  def sign_up_process
      @email = params[:email]
      @name = params[:name]
      @password = params[:password]
      
      #테이블 크리에이트
      User.create(
        email: @email,
        name: @name,
        password: @password
        
        )
  end


  def login
  end 
      
  
  def login_process
      @email = params[:email]
      @password = params[:password]
    
       #유저인증
      user = User.find_by(email: @email)
        # 유저가없다면=> nil
        # [email:asdaf, name: asdfg, password: asdfasdf]
      # 해당하는 email을 가진 user가 있다면
      if user
        #디비에 저장된 패스워드와 로그인 하려고 입력받은 값이 같다.
        if user.password == @password
          session[:user_email]  = user.email
          redirect_to '/'
        end
      end
  end  
    
  def logout
       session.clear
       redirect_to '/'
  end
    
    
end