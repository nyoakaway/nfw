const nyo_identity_img = 'http://127.0.0.1/nfw/identity/'

const nyo_identity = new Module('nyo_identity');

nyo_identity.registerOpenUiFunction((data) => {
    var d = data['data'];
    $(".identityCharAccountId").html(d.accountId);
    $(".identityCharId").html(d.charId);
    $(".identityCharName").html(d.charName);
    $(".identityCharPhone").html(d.charPhone);
    $(".identityCharAge").html(d.charAge);
    $(".identityCharRegistration").html(d.charIdentity);
    $(".identityCharBankMoney").html("R$ "+d.bankMoney);
})

nyo_identity.registerCloseUiFunction(data => {
    FetchData('close', {})
})