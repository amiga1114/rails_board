#### Atom과 Rails로 실습 진행 !

### 1. 오늘의 복습은 rails 밑바닥부터 짜기 !

> #### 1. rails_board 만들기 !
>
> ```
> # Rails 프로젝트를 생성 'rails_board'
> # posts 컨트롤러 생성
> # Post 모델을 생성
> # get '/' => 'posts#index'
> # 'posts#index'
> #=> 게시글을 모두 보여준다.
> # '/posts/new' '새글 쓰기' 링크를 보여준다.
> # 'posts#new'
> # <form> 통해 title, content -> /posts/create
> # 'posts#create'
> # 1. new에서 날라온 데이터로 Post 모델에 새로운 데이터를 create 한다.
> # 2. 아무것도 render하지 않고, '/' 리다이렉트 시켜준다.
>
> # rails g controller posts index new create -> 컨트롤러들을 다 만들어줌
> # rails g model Post title content -> schema.rb 에 title, cotent를 자동으로 추가해서 만들어줌
> ```
>
> #### 2. rails 개발에 필요한 잼들!
>
> ```
> # --------------------------------------------------------------------------------------#
> # 이것들은 개발할때 꼭 필요한 잼들 !
> # Gemfile 에 아래의 잼들을 추가하고
> # gem 'rails_db'
> # gem 'awesome_print'
> # gem 'pry-rails'
> # 추가후 bundle install 해주자 !
> ```
>
> #### 3. 개발 꿀팁 !
>
> ```
> # routes.rb 에서 
> # get '/' => 'posts#index' 
> # get '/posts/new' => 'posts#new'
> # get '/posts/create' => 'posts#create'
>
> # 위와 같이 이름이 똑같다면 ! 
> # get '/'
> # get '/posts/new'
> # get '/posts/create' 만 적어줘도 된다 !
> ```
>
> #### 4. 수정, 삭제 만들기
>
> ```
> # routes.rb
> get '/posts/destroy/:id' => 'posts#destroy'
> get '/posts/edit/:id' => 'posts#edit'
> get '/posts/update/:id' => 'posts#update'
>
> # posts_controller.rb
>   def destroy
>     # :id를 통해 Post 찾는다.
>     # 그걸 찾는다.
>     post = Post.find(params[:id])
>     post.destroy
>
>     redirect_to '/'
>   end
>
>   def edit
>     @post = Post.find(params[:id])
>   end
>
>   def update
>     # :id를 통해 Post 찾는다.
>     # 그걸 업데이트 해준다.
>     post = Post.find(params[:id])
>
>     post.update(
>       title: params[:title],
>       content: params[:content]
>     )
>     redirect_to '/'
>   end
> ```
>
> - erb
>
> ```
> <!-- index.erb -->
> <!--  데이터베이스에서 우리가 삭제하고자 하는 글을 찾는다. -->
> <!--  해당하는 글을 삭제한다.-->
> <a href="/posts/destroy/<%= list.id%>">삭제</a>
> <!--  데이터베이스에서 우리가 수정하고자 하는 글을 찾는다.-->
> <!--  찾은 글을 <form>에 보여주고 수정할 내용을 입력 받는다.-->
> <!--  입력받은 내용을 받아서 데이터베이스에서 수정한다.-->
> <a href="/posts/edit/<%= list.id %>">수정</a>
>
> <!-- edit.erb-->
> <a href="/">홈으로</a>
> <h1>글 수정하기</h1>
> <form action="/posts/update/<%= @post.id %>">
>   <input type="text" name="title" value="<%= @post.title %>">
>   <input type="text" name="content" value="<%= @post.content %>">
>   <input type="submit" value="확인">
> </form>
> ```