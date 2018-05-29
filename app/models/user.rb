class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true

  before_validation :get_ldap_email
         #attr_accessor :username
   def get_ldap_email
      self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
   end

   # use ldap uid as primary key
   before_validation :get_ldap_id
   def get_ldap_id
      params = Devise::LDAP::Adapter.get_ldap_param(self.username,"objectSid").first
      params_s = get_sid_string(params)
      self.id = params_s

   end

         # hack for remember_token
   def authenticatable_token
        Digest::SHA1.hexdigest(email)[0,29]
    end
before_validation :get_ldab_name
    def get_ldab_name
      self.name = Devise::LDAP::Adapter.get_ldap_param(self.username,"name").first
    end

    def get_sid_string(data)
        sid = data.unpack('b x nN V*')
        sid[1, 2] = Array[nil, b48_to_fixnum(sid[1], sid[2])]
        sid.delete("-")
      end

      B32 = 2**32

      def b48_to_fixnum(i16, i32)
        i32 + (i16 * B32)
      end
end
