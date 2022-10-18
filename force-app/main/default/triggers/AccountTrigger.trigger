trigger AccountTrigger on Account (before update) {
    List<Contact> ConList = new List<Contact>();
    List<Contact> ConUpdateList = new List<Contact>();
    
    For(Account Acc : [Select ID,(Select ID, checkBox from Contacts) from Account where ID IN: Trigger.new ])
    {
        if(Acc.Contacts.size() != 0)
        {
            ConList.add(Acc.Contacts);  
        }
    }
    For(Contact c : ConList)
    {
        if(c.checkbox != True)
        {   c.checkbox = True;
            ConUpdateList.add(c); 
        }
    }

    update ConUpdateList;
}