public class WrapClass {
    public List<wrapAccount> wrapaccountlist{get;set;}
    public List<Account> selectedaccounts{get;set;}
    
    public WrapClass(){
        wrapaccountlist = new List<wrapAccount>();
        for(Account a : [select id,name,billingcity, phone from Account limit 10]){
            wrapaccountlist.add(new wrapAccount(a));
        }
    }
    public void processSelected(){
        selectedaccounts = new List<Account>();
        for(wrapAccount w : wrapaccountlist){
            if(w.isSelected == true){
                selectedaccounts.add(w.acc);
            }
        }
    }
    
    public class wrapAccount {
        public account acc{get;set;}
        public boolean isSelected{get;set;}
        
        public wrapAccount(account a){
            acc=a;
            isSelected = false;
        }
     
    }
}