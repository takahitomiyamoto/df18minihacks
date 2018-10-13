({

  doInit: function (component, event, helper) {
    const accountId = component.get("v.recordId");
    helper.loadContacts(component, accountId, "");
  },

  handleChange: function (component, event, helper) {
    const accountId = component.get("v.recordId");
    const contactName = component.find('contactName').get("v.value");
    helper.loadContacts(component, accountId, contactName);
  }

})