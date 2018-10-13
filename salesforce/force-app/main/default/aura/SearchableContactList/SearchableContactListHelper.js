({

  loadContacts: function(component, accountId, contactName) {
    console.log('loadContacts: ' + accountId + " - " + contactName);

    const action = component.get("c.getContacts");
    action.setParams({
      accountId: accountId,
      contactName: contactName
    });
    action.setCallback(this, function(response) {
      const state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.contacts", response.getReturnValue());
      }
    });
    $A.enqueueAction(action);
  }

})