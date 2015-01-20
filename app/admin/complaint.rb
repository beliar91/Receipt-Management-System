#encoding: utf-8

ActiveAdmin.register Complaint do

  scope :wymagają_zaakceptowania do |complaints|
      complaints.where(:complaint_status_id=> 1)
  end

  scope :odrzucone do |complaints|
    complaints.where(:complaint_status_id=> 2)
  end

  scope :w_toku do |complaints|
    complaints.where(:complaint_status_id=> 3)
  end

  scope :uznane do |complaints|
    complaints.where(:complaint_status_id=> 4)
  end

  scope :nieuznane do |complaints|
    complaints.where(:complaint_status_id=> 5)
  end


  permit_params :reason, :user_id, :reject_reason, :already_reviewed, :complaint_status_id, :article_id


  index :title => 'Reklamacje' do
    selectable_column

    column "Powód złożenia", :reason, :sortable => :name do |complaint|
      link_to complaint.reason, admin_complaint_path(complaint)
    end

    column "Powód odrzucenia", :reject_reason, :class => 'center'

    column "Status reklamacji", :sortable => :complaint_status_id do |c|
      ComplaintStatus.find(c.complaint_status_id).name
    end

    column "Utworzono", :created_at
    column "Zaktualizowano", :updated_at

    column "Utworzył użytkownik" do |u|
      user = User.find(u.user_id).email
    end

    column "Reklamowany artykuł"  do |a|
      link_to Article.find(a.article_id).name, admin_article_path(a.article_id)
    end

    column "Czy już została oceniona?", :already_reviewed, :class => 'center'


    actions
  end

  form do |f|
    f.inputs "Utwórz nową reklamację" do
      f.input :article_id, :label => 'Reklamowany artykuł', :as => :select, :collection => Article.all.map{|u| ["#{u.name}", u.id]}
      f.input :user_id, label: "Utworzył użytkownik", :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
      f.input :reason, label: "Powód reklamacji"
      f.input :reject_reason, label: "Odrzucona z powodu"
      f.input :complaint_status_id, label: "Status reklamacji", :as => :select, :collection => ComplaintStatus.all.map{|u| ["#{u.name}", u.id]}
      f.input :already_reviewed, label: "Czy już ją oceniono?"

    end
    f.actions
  end


end