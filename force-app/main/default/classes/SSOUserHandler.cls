//This class provides logic for inbound just-in-time provisioning of single sign-on users in your Salesforce organization.
global class SSOUserHandler implements Auth.SamlJitHandler {
 
    //JIT Handler Exception
    private class JitException extends Exception {}
 
    //Handle User
    private void handleUser(boolean create, User u, Map < String, String > attributes, String federationIdentifier, boolean isStandard) {
 
        if (create && attributes.containsKey('User.Username')) {
            u.Username = attributes.get('User.Username');
        }
        if (create) {
            if (attributes.containsKey('User.FederationIdentifier')) {
                u.FederationIdentifier = attributes.get('User.FederationIdentifier');
            } else {
                u.FederationIdentifier = federationIdentifier;
            }
        }
        if (attributes.containsKey('User.ProfileId')) {
            String profileId = attributes.get('User.ProfileId');
            Profile p = [SELECT Id FROM Profile WHERE Id =: profileId];
            u.ProfileId = p.Id;
        }
        if (attributes.containsKey('User.UserRoleId')) {
            String userRole = attributes.get('User.UserRoleId');
            UserRole r = [SELECT Id FROM UserRole WHERE Id =: userRole];
            u.UserRoleId = r.Id;
        }
        if (attributes.containsKey('User.Phone')) {
            u.Phone = attributes.get('User.Phone');
        }
        if (attributes.containsKey('User.Email')) {
            u.Email = attributes.get('User.Email');
        }
        if (attributes.containsKey('User.FirstName')) {
            u.FirstName = attributes.get('User.FirstName');
        }
        if (attributes.containsKey('FirstName')) {
            u.FirstName = attributes.get('FirstName');
        }
        if (attributes.containsKey('User.LastName')) {
            u.LastName = attributes.get('User.LastName');
        }
        if (attributes.containsKey('User.Title')) {
            u.Title = attributes.get('User.Title');
        }
        if (attributes.containsKey('User.CompanyName')) {
            u.CompanyName = attributes.get('User.CompanyName');
        }
        if (attributes.containsKey('User.AboutMe')) {
            u.AboutMe = attributes.get('User.AboutMe');
        }
        if (attributes.containsKey('User.Street')) {
            u.Street = attributes.get('User.Street');
        }
        if (attributes.containsKey('User.State')) {
            u.State = attributes.get('User.State');
        }
        if (attributes.containsKey('User.City')) {
            u.City = attributes.get('User.City');
        }
        if (attributes.containsKey('User.Zip')) {
            u.PostalCode = attributes.get('User.Zip');
        }
        if (attributes.containsKey('User.Country')) {
            u.Country = attributes.get('User.Country');
        }
        if (attributes.containsKey('User.CallCenter')) {
            u.CallCenterId = attributes.get('User.CallCenter');
        }
        if (attributes.containsKey('User.Manager')) {
            u.ManagerId = attributes.get('User.Manager');
        }
        if (attributes.containsKey('User.MobilePhone')) {
            u.MobilePhone = attributes.get('User.MobilePhone');
        }
        if (attributes.containsKey('User.DelegatedApproverId')) {
            u.DelegatedApproverId = attributes.get('User.DelegatedApproverId');
        }
        if (attributes.containsKey('User.Department')) {
            u.Department = attributes.get('User.Department');
        }
        if (attributes.containsKey('User.Division')) {
            u.Division = attributes.get('User.Division');
        }
        if (attributes.containsKey('User.EmployeeNumber')) {
            u.EmployeeNumber = attributes.get('User.EmployeeNumber');
        }
        if (attributes.containsKey('User.Extension')) {
            u.Extension = attributes.get('User.Extension');
        }
        if (attributes.containsKey('User.Fax')) {
            u.Fax = attributes.get('User.Fax');
        }
        if (attributes.containsKey('User.CommunityNickname')) {
            u.CommunityNickname = attributes.get('User.CommunityNickname');
        }
        if (attributes.containsKey('User.IsActive')) {
            String IsActiveVal = attributes.get('User.IsActive');
            u.IsActive = '1'.equals(IsActiveVal) || Boolean.valueOf(IsActiveVal);
        }
        if (attributes.containsKey('User.ReceivesAdminInfoEmails')) {
            String ReceivesAdminInfoEmailsVal = attributes.get('User.ReceivesAdminInfoEmails');
            u.ReceivesAdminInfoEmails = '1'.equals(ReceivesAdminInfoEmailsVal) || Boolean.valueOf(ReceivesAdminInfoEmailsVal);
        }
        if (attributes.containsKey('User.ReceivesInfoEmails')) {
            String ReceivesInfoEmailsVal = attributes.get('User.ReceivesInfoEmails');
            u.ReceivesInfoEmails = '1'.equals(ReceivesInfoEmailsVal) || Boolean.valueOf(ReceivesInfoEmailsVal);
        }
        if (attributes.containsKey('User.ForecastEnabled')) {
            String ForecastEnabledVal = attributes.get('User.ForecastEnabled');
            u.ForecastEnabled = '1'.equals(ForecastEnabledVal) || Boolean.valueOf(ForecastEnabledVal);
        }
        String uid = UserInfo.getUserId();
        User currentUser = [SELECT LocaleSidKey, LanguageLocaleKey, TimeZoneSidKey, EmailEncodingKey FROM User WHERE Id =: uid];
        if (attributes.containsKey('User.LocaleSidKey')) {
            u.LocaleSidKey = attributes.get('User.LocaleSidKey');
        } else if (create) {
            u.LocaleSidKey = currentUser.LocaleSidKey;
        }
        if (attributes.containsKey('User.LanguageLocaleKey')) {
            u.LanguageLocaleKey = attributes.get('User.LanguageLocaleKey');
        } else if (create) {
            u.LanguageLocaleKey = currentUser.LanguageLocaleKey;
        }
        if (attributes.containsKey('User.Alias')) {
            u.Alias = attributes.get('User.Alias');
        } else if (create) {
            String alias = '';
            if (u.FirstName == null) {
                alias = u.LastName;
            } else {
                alias = u.FirstName.charAt(0) + u.LastName;
            }
            if (alias.length() > 5) {
                alias = alias.substring(0, 5);
            }
            u.Alias = alias;
        }
        if (attributes.containsKey('User.TimeZoneSidKey')) {
            u.TimeZoneSidKey = attributes.get('User.TimeZoneSidKey');
        } else if (create) {
            u.TimeZoneSidKey = currentUser.TimeZoneSidKey;
        }
        if (attributes.containsKey('User.EmailEncodingKey')) {
            u.EmailEncodingKey = attributes.get('User.EmailEncodingKey');
        } else if (create) {
            u.EmailEncodingKey = currentUser.EmailEncodingKey;
        }
 
 
 // CUstom COde
 Account account_1 = new Account( Name = 'Community'  );
  insert account_1;
  
  Contact contact_1 = new Contact(AccountId = account_1.Id, LastName = 'xgeek');
  insert contact_1;
  
  u.ContactId = contact_1.Id;
  //u.PortalRole = 'Manager';
        if (!create) {
            update(u);
        } else {
            Insert u;
        }
        
        //upsert u;
    }
 
    //Handle JIT
    private void handleJit(boolean create, User u, Id samlSsoProviderId, Id communityId, Id portalId, String federationIdentifier, Map < String, String > attributes, String assertion) {
        handleUser(create, u, attributes, federationIdentifier,true);
    }
 
    //For New User
    global User createUser(Id samlSsoProviderId, Id communityId, Id portalId,
        String federationIdentifier, Map < String, String > attributes, String assertion) {
        User u = new User();
        handleJit(true, u, samlSsoProviderId, communityId, portalId, federationIdentifier, attributes, assertion);
        return u;
    }
 
    //For Existing User
    global void updateUser(Id userId, Id samlSsoProviderId, Id communityId, Id portalId,
        String federationIdentifier, Map < String, String > attributes, String assertion) {
        User u = [SELECT Id, FirstName, ContactId FROM User WHERE Id =: userId];
        handleJit(false, u, samlSsoProviderId, communityId, portalId, federationIdentifier, attributes, assertion);
    }
}