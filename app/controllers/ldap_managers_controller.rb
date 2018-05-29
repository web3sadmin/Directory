class LdapManagersController < ApplicationController
before_action :set_index, only: [:show, :edit, :update, :destroy]

  # GET /ldap_managers
  # GET /ldap_managers.json
  def index
    @directory = Index.all
    @index = Index.new
    @ldap_managers = LdapManager.all
    ldap = Net::LDAP.new	:host => "dc-01.pluton.biz",
                :port => 389,
                :encryption => :none,
                :base => "DC=pluton,DC=biz",
                :auth => {
                  :method => :simple,
                  :username => "mikle.admin@pluton.biz",
                  :password => "3ssqA3uh"
                }
                filter = Net::LDAP::Filter.eq("sAMAccountName", "*")
                filter2 = Net::LDAP::Filter.eq("objectCategory", "organizationalPerson")
                joined_filter = Net::LDAP::Filter.join(filter, filter2)
                treebase = "ou=запорожье,dc=pluton,dc=biz"
    @ldusers = ldap.search(:base => treebase, :filter => joined_filter, :return_result => true)
  end
  def create
      @index = Index.new(index_params)

      respond_to do |format|
        if @index.save
          format.html { redirect_to request.referrer, notice: 'Index was successfully created.' }
          format.json { render :show, status: :created, location: @index }
        else
          format.html { render :new }
          format.json { render json: @index.errors, status: :unprocessable_entity }
        end
      end
    end

    def import_all
      ldap = Net::LDAP.new	:host => "dc-01.pluton.biz",
      						:port => 389,
      						:encryption => :none,
      						:base => "DC=pluton,DC=biz",
      						:auth => {
      							:method => :simple,
      							:username => "mikle.admin@pluton.biz",
      							:password => "3ssqA3uh"
      						}

                  filter = Net::LDAP::Filter.eq("sAMAccountName", "*")
                  filter2 = Net::LDAP::Filter.eq("objectCategory", "organizationalPerson")
                  joined_filter = Net::LDAP::Filter.join(filter, filter2)
                  treebase = "ou=запорожье,dc=pluton,dc=biz"
      @ldusers = ldap.search(:base => treebase, :filter => joined_filter, :return_result => true)
      @ldusers.each do |ldap|
                  pluton_worker = Index.new
                  pluton_worker.name = ldapadap(ldap, :name)
                  pluton_worker.givenName = ldapadap(ldap, :givenName)
                  pluton_worker.sAMAccountName = ldapadap(ldap, :sAMAccountName)
                  pluton_worker.sn = ldapadap(ldap, :sn)
                  pluton_worker.displayName = ldapadap(ldap, :displayName)
                  pluton_worker.description = ldapadap(ldap, :description)
                  pluton_worker.physicalDeliveryOfficeName = ldapadap(ldap, :physicalDeliveryOfficeName)
                  pluton_worker.telephoneNumber = ldapadap(ldap, :telephoneNumber)
                  pluton_worker.mail = ldapadap(ldap, :mail)
                  pluton_worker.title = ldapadap(ldap, :title)
                  pluton_worker.department = ldapadap(ldap, :department)
                  pluton_worker.company = ldapadap(ldap, :company)
                  pluton_worker.ipphone = ldapadap(ldap, :ipphone)
                  pluton_worker.mobile = ldapadap(ldap, :mobile)
                  pluton_worker.company = ldapadap(ldap, :company)
                  pluton_worker.homephone = ldapadap(ldap, :homephone)
                  pluton_worker.cloudUser = false
                  pluton_worker.usbUser = false
                  pluton_worker.userit = false
                  pluton_worker.registered = true
                  pluton_worker.photo = '/public/images/avatar/'+ldapadap(ldap, :sAMAccountName)+'.jpg'
                  pluton_worker.save
                end
      redirect_to request.referrer, notice: "Импорт завершен."
    end

    def matching

    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_index
      @index = Index.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def index_params
      params.require(:name).permit(:name, :givenName, :sn, :sAMAccountName, :displayName, :description, :physicalDeliveryOfficeName, :telephoneNumber, :mail, :title, :department, :company, :ipphone, :mobile, :homephone, :photo, :cloudUser, :usbUser, :userit)
    end
    def ldapadap(data,key)
      begin
        data[key].to_s.delete('"[]"')
      rescue
      end
    end
end
