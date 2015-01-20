#encoding: utf-8

ActiveAdmin.register ComplaintReview do

  permit_params :examination_time, :client_approach, :satisfaction, :complaint_id, :user_id, :comment


  index :title => 'Oceny Reklamacji' do
    selectable_column

    column "Ocena czasu realizacji reklamacji [1-5]", :examination_time, :class => 'center'
    column "Ocena podejścia do klienta[1-5]", :client_approach, :class => 'center'
    column "Ocena satysfakcji klienta[1-5]", :satisfaction, :class => 'center'

    column "Oceniana reklamacja", :sortable => :complaint_id do |c|
      link_to Complaint.find(c.complaint_id).reason, admin_complaint_path(c.complaint_id)
    end

    column "Utworzył użytkownik" do |u|
      user = User.find(u.user_id).email
    end

    column "Komentarz", :comment

    column "Utworzono", :created_at
    column "Zaktualizowano", :updated_at


    actions
  end

  # form do |f|
  #   f.inputs "Utwórz nową reklamację" do
  #     f.input :article_id, :label => 'Reklamowany artykuł', :as => :select, :collection => Article.all.map{|u| ["#{u.name}", u.id]}
  #     f.input :user_id, label: "Utworzył użytkownik", :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
  #     f.input :reason, label: "Powód reklamacji"
  #     f.input :reject_reason, label: "Odrzucona z powodu"
  #     f.input :complaint_status_id, label: "Status reklamacji", :as => :select, :collection => ComplaintStatus.all.map{|u| ["#{u.name}", u.id]}
  #     f.input :already_reviewed, label: "Czy już ją oceniono?"
  #
  #   end
  #   f.actions
  # end


end