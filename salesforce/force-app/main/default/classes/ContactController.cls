public with sharing class ContactController {

  @AuraEnabled
  public static List<Contact> getContacts(String accountId, String contactName) {
    Boolean hasContactName = (String.isNotEmpty(contactName));
    String contactNameLike = '';
    if (hasContactName) {
      contactNameLike = String.escapeSingleQuotes(contactName);
    }

    String query = '' +
      ' SELECT ' +
      '   Id,' +
      '   Name,' +
      '   Title,' +
      '   Email,' +
      '   Phone' +
      ' FROM' +
      '   Contact' +
      ' WHERE' +
      '   AccountId = \'' + accountId + '\'' +
      '   AND Name LIKE \'%' + contactNameLike + '%\'' +
      ' LIMIT 50000';

    System.debug(query);
    List<Contact> contacts = System.Database.query(query);

    return contacts;
  }

}