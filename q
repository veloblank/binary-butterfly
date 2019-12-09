
[1mFrom:[0m /home/veloblank/dev/projects/flatiron-rails-projects/binary-butterfly/binary-butterfly-backend/app/controllers/api/v1/users_controller.rb @ line 6 Api::V1::UsersController#create:

     [1;34m2[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m3[0m:   user = [1;34;4mUser[0m.find_or_initialize_by(user_params)
     [1;34m4[0m:   [1;34m#NO Authentication or Authorization is taking place[0m
     [1;34m5[0m:   [32mif[0m [1;34;4mUser[0m.exists?(user.id)
 =>  [1;34m6[0m:     binding.pry
     [1;34m7[0m:     board = user.contest_boards.find_or_create_by([1;34;4mDateTime[0m.now.beginning_of_day)
     [1;34m8[0m:     render [35mjson[0m: user, [35mstatus[0m: [1;34m200[0m
     [1;34m9[0m:   [32melsif[0m user.save
    [1;34m10[0m:     board = user.contest_boards.find_or_create_by([1;34;4mDateTime[0m.now.beginning_of_day)
    [1;34m11[0m:     render [35mjson[0m: user, [35mstatus[0m: [1;34m200[0m
    [1;34m12[0m:     [32melse[0m
    [1;34m13[0m:     render [35mjson[0m: {
    [1;34m14[0m:       [35mmessage[0m: {
    [1;34m15[0m:         [35merrors[0m: user.errors.full_messages
    [1;34m16[0m:       }
    [1;34m17[0m:     }
    [1;34m18[0m:   [32mend[0m
    [1;34m19[0m: [32mend[0m

