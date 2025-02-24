  
    
const nyo_gm = new Module('nyo_groupmanager');
var dataC;
var userList = []

nyo_gm.registerOpenUiFunction((data) => { 
    //nyo_gm.disableKeyPress("Enter");

    userList = []
    for (const [k, v] of Object.entries(data.members)) {
        if (k != '') userList.push({...v, id: k})
    }

    dataC = data

    $(".navTitle").html(`${data.name || ''}`)
    $(".navUserName").html(`${data.members[data.char_id].name || ''}`);

    // Container Home 
    $(".cHomeMembers").html(`${userList.length}`);
    $(".cHomeMaxMember").html(`${data.max_members}`);
    $(".cHomeMoneyText").html(`R$ ${ new Intl.NumberFormat('pt-BR').format(data.money)},00`)
    
    
    // ContainerUsers
    loadPageUsers();
    loadPageGroups();

    // Container Upgrade 
    loadPageUpgrade();

    // Container ServiceToogle
    loadPageToogle();

    // Money Actions
    loadMoneyPage();

    // Action OPEN 
    $(".menuContainer").css("display", "none");
    $(".containerHome").css("display", "block");
})


nyo_gm.registerCloseUiFunction(data => {
    FetchData('close', {})
})

function loadPageUsers(){
    $(".tableUsers").html('');
    let canKick = dataC.char_permissions['kick-member'] || dataC.members[dataC.char_id].owner

    document.getElementById('contract-button').style.display = (dataC.char_permissions['contract-members'] || dataC.members[dataC.char_id].owner) ? 'block' : 'none'

    let userListHTML = `
    <div class="style5 p-1">
    <table class="table table-sm table-dark table-striped table-bordered ">`;

    userListHTML += `
    <thead>
        <tr>
            <th class="title-table-pannel" id="sort-id">ID</th>
            <th class="title-table-pannel" id="sort-name">Nome</th>
            <th class="title-table-pannel" id="sort-group">Cargo</th>
            <th class="title-table-pannel" id="sort-donate">Doações</th>
            ${canKick ? '<th class="title-table-pannel">Ações</th>' : ''}
        </tr>
    </thead>
    <tbody>`;

    userList.map((user, index) => userListHTML += `
        <tr data-user="${index}" class="user${user.id}">
            <td class="item-table-simple-id-panel item-table-panel correct__mar">${user.id}</td>
            <td class="item-table-simple-name-panel item-table-panel correct__mar">${user.name}</td>
            <td class="item-table-simple-job-panel item-table-panel fl__center">
                <select data-id="${user.id}" data-index="${index}" class="change-group select-form z-ind" ${dataC.char_permissions['change-groups'] ? '': dataC.members[dataC.char_id].owner ? '' : 'disabled'} onchange="userChangeGroup(this)">
                    ${getSelect(user.group)} 
                </select>
            </td>
            <td class="item-table-simple-donations-panel item-table-panel correct__mar">R$ ${ new Intl.NumberFormat('pt-BR').format(user.donatedMoney)},00</td>               
            ${canKick ? '<td class="item-table-simple-buttons-panel item-table-panel"><button class="btn btn-sm btn-danger position-relative" data-id="'+user.id+'" onclick="userKick(this)">Demitir</button></td>' : ''}
        </tr>
        `);

    userListHTML += `</tbody></table></div>`;
    $(".tableUsers").html(userListHTML);
}

function loadPageGroups(){
    grupoAddAction();
    document.getElementById('groupadd-button').style.display = (dataC.members[dataC.char_id].owner) ? 'block' : 'none'

    let groupsHTML = `
    <div class="style5 p-1">
    <table class="table table-sm table-dark table-striped table-bordered ">`;

    groupsHTML += `
    <thead>
        <tr>
            <th class="title-table-pannel" id="sort-id">ID</th>
            <th class="title-table-pannel" id="sort-name">Nome</th>
            ${dataC.members[dataC.char_id].owner ? '<th class="title-table-pannel">Ações</th>' : ''}
        </tr>
    </thead>
    <tbody>`;

    for (const [k, v] of Object.entries(dataC.groups)) {
        if (k != '' && v[0] != undefined && v[0] != '') groupsHTML += `
        <tr group-id="${k}" class="trGroup${k}">
            <td class="" style="width: 10%">${k}</td>
            <td class="">${v[0]}</td>
            <td class="" style="width: 20%"><button class="btn btn-sm btn-danger position-relative" type="button" data-id="${k}" onclick="grupoDelAction(this)">Deletar</button> <button type="button" class="btn btn-sm btn-primary position-relative" data-id="${k}" onclick="grupoEditAction(this)">Editar</button></td>
        </tr>
        `
    }

    groupsHTML += `</tbody></table></div>`;

    $(".tableGroups").html(groupsHTML);
}

function loadPageUpgrade(){
    let upgradeHtml = ""

    const upgradeSort = Object.keys(dataC.config.upgrades)
        .sort()
        .reduce((accumulator, key) => {
            accumulator[key] = dataC.config.upgrades[key];

            return accumulator;
        }, {});

    for (const [k, v] of Object.entries(upgradeSort)) {
        upgradeHtml += `
        <div class="col-md-3 type1_margin">
            <div class="style7 p-1 new">
                <div class="card">
                    <img src="${v.image}" class="card-img-top" alt="...">
                    <section class="card-body">
                        <h5 class="card-title">${v.title}</h5>
                        <div class="footer-margin">
                            <p class="card-text">${v.description}</p>
                            <section class="row">
                                <div class="col coli">
                                    <button class="btn btn-primary position-relative" data-id="${k}" onClick="buyUpgrade(this)" ${ dataC.upgrades.find(el => el == k) ? 'disabled' : v.request != "" ? dataC.upgrades.find(el => el == v.request) ? '' : 'disabled' : '' }>${ dataC.upgrades.find(el => el == k) ? 'Adquirido' : v.request != "" ? dataC.upgrades.find(el => el == v.request) ? 'R$' + v.price : "Upgrade necessario!" : 'R$' + v.price }</button>
                                </div>
                            </section>
                        </div>
                    </section>
                </div>
                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>
        </div>`;
    }

    
    $(".containerUpgradeData").html(upgradeHtml);
}

function loadPageToogle(){
    var toogleHtml = "";    
    if(dataC.config.serviceToogle){
        var toogle = false 
        Object.keys(dataC.toogle).forEach(key => {
            var cId = dataC.toogle[key].char_id;
            if(cId == dataC.char_id){
                toogle = true;
            }
        });
        btnToogle = '<button class="btn btn-block btn-sm btn-success position-relative btn-serviceToogle" onclick="toogleService(true);">ENTRAR DE SERVIÇO</button>';
        if(toogle){
            btnToogle = '<button class="btn btn-block btn-sm btn-danger position-relative btn-serviceToogle" onclick="toogleService(false);">SAIR DE SERVIÇO</button>';
        }
        toogleHtml = `
        <div class="row">
            <div class="col-4"></div>
            <div class="type1_margin col-4">
                <div class="box-style style4 p-1 new">
                    <div class="hw1 d-flex">
                        <article>
                            <h1> ENTRAR / SAIR DE SERVIÇO </h1>
                            ${btnToogle}
                        </article>
                    </div>
                    <div class="card-arrow">
                        <div class="card-arrow-top-left"></div>
                        <div class="card-arrow-top-right"></div>
                        <div class="card-arrow-bottom-left"></div>
                        <div class="card-arrow-bottom-right"></div>
                    </div>
                </div>
            </div>
            <div class="col-4"></div>
        </div>
        `;
    }
    $(".containerServiceToogleData").html(toogleHtml);
}

function getSelect(g) {
    let groupsOptions = ''
    let selected
    for (const [k, v] of Object.entries(dataC.groups)) {
        if (k != '') {
            if (k == g) selected = true
            groupsOptions += `<option value="${k}" ${k == g ? 'selected' : ''}>${v[0]}</option>`
        }
    }
    if (!selected) groupsOptions += '<option disabled selected>Selecionar cargo</option>'
    return groupsOptions
}

function changeMenu(e){
    var nMenu = e.dataset.id;
    $(".menuContainer").css("display", "none");
    $(".container"+nMenu).css("display", "block");
}

function contratarAction(){
    Swal.fire({
        title: 'ID DO USUARIO',
        input: 'number',
        confirmButtonText: 'Confirmar',
        cancelButtonText: 'Cancelar',
        showCancelButton: true,
        inputAttributes: {min: 1},
    }).then((value) => {
        if (value.value !== undefined) {
            var id = value.value;
            if (id) FetchData("contractId", {id})
        }
    });
}

function grupoAddAction(){
    groupAddHTML = ``;
    if(dataC.members[dataC.char_id].owner){

        const permissions = [
            ...dataC.config.customPermissions,
            ['Expulsar membro', 'kick-member'],
            ['Alterar cargos', 'change-groups'],
            ['Transferir / Sacar dinheiro', 'money-management'],
            ['Comprar upgrades', 'buy-upgrades'],
            ['Olhar histórico de membros', 'see-historic'],
            ['Contratar membros', 'contract-members'],
        ]

        groupAddHTML = `
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form class="formGroupAdd">
                        <div class="box-style style5 pt-3 pb-3 new">
                            <div class="row w-100">
                                <div class="col-12">
                                    <div class="type__mo z-ind">
                                        <label class="form-label">Nome</label>
                                        <input type="text" class="form-control" name="gName" autocomplete="off">
                                    </div>
                                    <div class="type1__pad1">
                                        <label class="form-label">PERMISSÕES</label>
                                        <div class="row type__mt">
                                            ${permissions.map(v => `
                                                <div class="col-md-5">
                                                    <div class="form-check z-ind">
                                                        <input name="${v[1]}" class="form-check-input" type="checkbox" id="${v[1]}">
                                                        <label class="form-check-label text-nowrap" for="defaultCheck1">
                                                            ${v[0]}
                                                        </label>
                                                    </div>
                                                </div>
                                            `).join('')}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button class="btn btn-block btn-success" type="button" onclick="addGroupSaveAdd()">SALVAR</button>
                                </div>
                            </div>
                            <div class="card-arrow">
                                <div class="card-arrow-top-left"></div>
                                <div class="card-arrow-top-right"></div>
                                <div class="card-arrow-bottom-left"></div>
                                <div class="card-arrow-bottom-right"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        `;
    }    
    $(".containerGroupAddData").html(groupAddHTML);
}

function grupoEditAction(e){
    groupId = e.dataset.id;
    groupAddHTML = ``;
    if(dataC.members[dataC.char_id].owner){

        const permissions = [
            ...dataC.config.customPermissions,
            ['Expulsar membro', 'kick-member'],
            ['Alterar cargos', 'change-groups'],
            ['Transferir / Sacar dinheiro', 'money-management'],
            ['Comprar upgrades', 'buy-upgrades'],
            ['Olhar histórico de membros', 'see-historic'],
            ['Contratar membros', 'contract-members'],
        ]

        groupAddHTML = `

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form class="formGroupAdd">
                    <div class="box-style style5 pt-3 pb-3 new">
                        <div class="row w-100">
                            <div class="col-12">
                                <div class="type__mo z-ind">
                                    <label class="form-label">Nome</label>
                                    <input type="text" class="form-control" name="gName" value="${dataC.groups[groupId][0]}" autocomplete="off">
                                    <input type="hidden" class="form-control" name="gId" value="${groupId}" autocomplete="off">
                                </div>
                                <div class="type1__pad1">
                                    <label class="form-label">PERMISSÕES</label>
                                    <div class="row type__mt">
                                        ${permissions.map(v => `
                                            <div class="col-md-5">
                                                <div class="form-check z-ind">
                                                    <input name="${v[1]}" class="form-check-input" type="checkbox" id="${v[1]}" ${dataC.groups[groupId][1].find(el => el == v[1]) ? 'checked' : ''}>
                                                    <label class="form-check-label text-nowrap" for="defaultCheck1">
                                                        ${v[0]}
                                                    </label>
                                                </div>
                                            </div>
                                        `).join('')}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-block btn-success" type="button" onclick="groupSaveEdit()">SALVAR</button>
                            </div>
                        </div>
                        <div class="card-arrow">
                            <div class="card-arrow-top-left"></div>
                            <div class="card-arrow-top-right"></div>
                            <div class="card-arrow-bottom-left"></div>
                            <div class="card-arrow-bottom-right"></div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div> 
        `;
    }    
    $(".containerGroupAddData").html(groupAddHTML);

    document.querySelector('.formGroupAdd').onsubmit = e => e.preventDefault()

    var nMenu = 'GroupAdd';
    $(".menuContainer").css("display", "none");
    $(".container"+nMenu).css("display", "block");

}

function grupoDelAction(e){
    if(dataC.members[dataC.char_id].owner){
        const groupId = e.dataset.id;
        FetchData('deleteGroup', { groupId: groupId })
        dataC.groups[groupId][0] = '';
        $(".trGroup"+groupId).remove();
    }
}

async function addGroupSaveAdd(){
    if(dataC.members[dataC.char_id].owner){
        const formData = new FormData(document.querySelector('.formGroupAdd'));
        const formProps = Object.fromEntries(formData);     
        if(formProps.gName == ""){ return; }
        const { groupId } = await FetchData('createGroup', formProps);

        var groupPerm = [];
        for (const [k, v] of Object.entries(formProps)) {
            if(k != 'gName'){
                groupPerm.push(k)
            }
        }

        dataC.groups[groupId] = [formProps.gName, groupPerm];
        loadPageGroups();

        var nMenu = 'User';
        $(".menuContainer").css("display", "none");
        $(".container"+nMenu).css("display", "block");
    }    
}

function groupSaveEdit(){
    if(dataC.members[dataC.char_id].owner){
        const formData = new FormData(document.querySelector('.formGroupAdd'));
        const formProps = Object.fromEntries(formData);     
        if(formProps.gName == ""){ return; }

        var groupPerm = [];
        for (const [k, v] of Object.entries(formProps)) {
            if(k != 'gName' && k != 'gId'){
                groupPerm.push(k)
            }
        }

        FetchData('changeGroupPermissions', formProps)
        dataC.groups[formProps.gId] = [formProps.gName, groupPerm]

        loadPageGroups();

        var nMenu = 'User';
        $(".menuContainer").css("display", "none");
        $(".container"+nMenu).css("display", "block");
    }
}

function toogleService(e){    
    if(e){
        $(".btn-serviceToogle").removeClass("btn-sucess").addClass("btn-danger").html("SAIR DE SERVIÇO").attr("onclick", "toogleService(false);");
    }else{
        $(".btn-serviceToogle").removeClass("btn-danger").addClass("btn-success").html("ENTRAR DE SERVIÇO").attr("onclick", "toogleService(true);");
    }
    FetchData("toogleService",{});
}

function userKick(e){
    let canKick = dataC.char_permissions['kick-member'] || dataC.members[dataC.char_id].owner

    if(canKick){
        var userId = e.dataset.id;
        FetchData('kickMember', [parseInt(userId)]);
        $(".user"+userId).remove();
    }
}

function userChangeGroup(e){
    if(dataC.char_permissions['change-groups'] || dataC.members[dataC.char_id].owner){
        var userId = parseInt(e.dataset.id);
        var userIndex = parseInt(e.dataset.index);
        var groupId = e.value;
        FetchData('changeGroup',{char_id: userId, groupId:groupId});
        userList[userIndex]['group'] = groupId;
    }
}

function buyUpgrade(e){
    var upgradeId = e.dataset.id;
    var enable = false;
    var config = dataC.config.upgrades[upgradeId]

    if(dataC.upgrades.find(el => el == upgradeId)){
        
    }else{
        if(config.request == ""){
            enable = true;
        }else{
            if(dataC.upgrades.find(el => el == config.request)){
                enable = true; 
            }
        }
    }

    if(enable){
        if (dataC.money < config.price) return
        dataC.money -= config.price
        dataC.upgrades.push(upgradeId);
        $(".cHomeMoneyText").html(`R$ ${ new Intl.NumberFormat('pt-BR').format(dataC.money)},00`);
        FetchData("buyUpgrade", {upgradeId})
        loadPageUpgrade();
    }
}

function loadMoneyPage() {
    const moneyContainer = document.querySelector("#nui-nyo_groupmanager .containerMoney")
    const logsTypes = {
        1: 'Transferência',
        2: 'Depósito',
        3: 'Saque'
    }

    moneyContainer.innerHTML = `
    ${(dataC.char_permissions['money-management'] || dataC.members[dataC.char_id].owner) ? `
    <div class="row d-flex justify-content-center">
        <div class="type1_margin col-lg-3 col-6 m-2">
            <div class="box-style p-1 new">
                <div class="d-flex hw1 style__N1">
                    <div class="box__in1">
                        <p class="mb-1">Saldo</p>
                        <h1>R$${new Intl.NumberFormat(nyo_gm.currentLanguage, { minimumFractionDigits: 2 }).format(dataC.money)}</h1>
                    </div>

                    <figure>
                        <i class="fa-solid fa-wallet"></i>
                    </figure>
                </div>

                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>
        </div>
    </div>
    ` : ''}

    <div class="generalTitle text__style mb-3">AÇÕES</div>

    <div class="row d-flex justify-content-center">
        <div class="type1_margin col-lg-6 col-6 m-2">
            <div class="box-style style4 p-1 new">
                <div class="hw1 d-flex align-itens-center justify-content-center position-relative" style="flex-direction: column;z-index: 9999;">
                    <ul class="nav nav-tabs m-2" id="money-actions" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link text-primary ${(dataC.char_permissions['money-management'] || dataC.members[dataC.char_id].owner) ? '' : 'disabled'}" id="gm-transfer-tab" data-bs-toggle="tab" data-bs-target="#gm-transfer-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="false" style="z-index: 9999">Transferir</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link position-relative active text-primary" id="gm-deposit-tab" data-bs-toggle="tab" data-bs-target="#gm-deposit-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="true" style="z-index: 9999">Depositar</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link position-relative text-primary ${(dataC.char_permissions['money-management'] || dataC.members[dataC.char_id].owner) ? '' : 'disabled'}" id="gm-withdraw-tab" data-bs-toggle="tab" data-bs-target="#gm-withdraw-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false" style="z-index: 9999">Sacar</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="money-actions-content">
                        <div class="tab-pane fade " id="gm-transfer-tab-pane" role="tabpanel" aria-labelledby="gm-transfer-tab" tabindex="0">
                            <form id="gm-transfer-form">
                                <div class="mb-3">
                                    <label for="gm-transfer-code" class="form-label">Código de Transferência</label>
                                    <div class="input-group">
                                        <input type="text" required minlength="7" maxlength="7" class="form-control" id="gm-transfer-code" name="gm-transfer-code" placeholder="Digite aqui o código da organização para qual deseja realizar a transferência">
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label for="gm-transfer-value" class="form-label">Valor</label>
                                    <div class="input-group">
                                        <div class="input-group-text">R$</div>
                                        <input type="number" required min="1" class="form-control" id="gm-transfer-value" name="gm-transfer-value" placeholder="Digite aqui o valor da transferência">
                                    </div>
                                </div>
                                <button class="btn btn-sm btn-primary p-2" type="submit">CONCLUIR</button>
                            </form>
                        </div>
                        <div class="tab-pane fade show active" id="gm-deposit-tab-pane" role="tabpanel" aria-labelledby="gm-deposit-tab" tabindex="0">
                            <form id="gm-deposit-form">
                                <div class="mb-4">
                                    <label for="gm-deposit-value" class="form-label">Valor</label>
                                    <div class="input-group">
                                        <div class="input-group-text">R$</div>
                                        <input type="number" required min="1" class="form-control" id="gm-deposit-value" name="gm-deposit-value" placeholder="Digite aqui o valor do depósito">
                                    </div>
                                </div>
                                <button class="btn btn-sm btn-primary p-2" type="submit">CONCLUIR</button>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="gm-withdraw-tab-pane" role="tabpanel" aria-labelledby="gm-withdraw-tab" tabindex="0">
                            <form id="gm-withdraw-form">
                                <div class="mb-4">
                                    <label for="gm-withdraw-value" class="form-label">Valor</label>
                                    <div class="input-group">
                                        <div class="input-group-text">R$</div>
                                        <input type="number" min="1" class="form-control" id="gm-withdraw-value" name="gm-withdraw-value" placeholder="Digite aqui o valor do saque">
                                    </div>
                                </div>
                                <button class="btn btn-sm btn-primary p-2" type="submit">CONCLUIR</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>
        </div>
    </div>

    ${(dataC.char_permissions['money-management'] || dataC.members[dataC.char_id].owner) ? `
    <div class="row justify-content-center">
        <div class="col-md-12">

            <div class="row align-items-end d1__flex">
                <div class="d1__flex justify-content-center"> 
                    <div class="generalTitle titulo__geral">HISTÓRICO DE TRANSAÇÕES</div>
                </div>
            </div>

            <div class=" new">
                <div class="">
                    <div class="style5 p-1">
                        <table class="table table-sm table-dark table-striped table-bordered ">
                            <thead>
                                <tr>
                                    <th class="title-table-pannel" id="sort-id">Data</th>
                                    <th class="title-table-pannel" id="sort-name">Tipo</th>
                                    <th class="title-table-pannel" id="sort-group">Valor</th>
                                    <th class="title-table-pannel" id="sort-group">ID</th>
                                    <th class="title-table-pannel" id="sort-group">Código de Transferência</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${dataC.moneyLogs.map((v, k) => {
                                    const date = new Date(v.date);
                                return `
                                <tr>
                                    <td class="item-table-simple-id-panel item-table-panel correct__mar">${date.getDay()}/${date.getMonth()}/${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}</td>
                                    <td class="item-table-simple-name-panel item-table-panel correct__mar">${logsTypes[v.type]}</td>
                                    <td class="item-table-simple-name-panel item-table-panel correct__mar text-${v.type == 2 ? 'success' : 'danger'}">${new Intl.NumberFormat(nyo_gm.currentLanguage, { minimumFractionDigits: 2 }).format(v.data[0])}</td>
                                    <td class="item-table-simple-name-panel item-table-panel correct__mar">${v.data[1]}</td>
                                    <td class="item-table-simple-name-panel item-table-panel correct__mar">${v.type == 1 ? v.data[2] : '-'}</td>
                                </tr>
                                `}).join('')}
                            </tbody>
                        </table>
                </div>
                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>

        </div>
    </div>
    ` : ''}

    `

    const transferForm = document.getElementById("gm-transfer-form");
    transferForm.onsubmit = async e => {
        const data = new FormData(transferForm);
        const transferCode = data.get('gm-transfer-code').toUpperCase();
        const transferValue = parseInt(data.get('gm-transfer-value'));
        e.preventDefault();
        transferForm.reset();
        if (transferValue <= dataC.money) {
            const r = await nyo_gm.fetch('transfer', { amount: transferValue, orgTransferCode: transferCode });
            if (r.success) {
                dataC.money -= transferValue
                dataC.moneyLogs = [{ date: new Date(), type: 1, data: [transferValue, dataC.char_id, transferCode] }].concat(dataC.moneyLogs)
                loadMoneyPage()
            };
        };
    };

    const depositForm = document.getElementById('gm-deposit-form');
    depositForm.onsubmit = async e => {
        const data = new FormData(depositForm);
        const depositValue = parseInt(data.get('gm-deposit-value'));
        e.preventDefault();
        depositForm.reset();
        const r = await nyo_gm.fetch('deposit', { amount: depositValue })
        if (r.success) {
            dataC.money += depositValue;
            dataC.moneyLogs = [{date: new Date(), type: 2, data: [depositValue, dataC.char_id]}].concat(dataC.moneyLogs)
            loadMoneyPage();
        };
    };

    const withdrawForm = document.getElementById('gm-withdraw-form');
    withdrawForm.onsubmit = async e => {
        const data = new FormData(withdrawForm);
        const withdrawValue = parseInt(data.get("gm-withdraw-value"));
        e.preventDefault();
        withdrawForm.reset();
        if (withdrawValue <= dataC.money) {
            const r = await nyo_gm.fetch('withdraw', { amount: withdrawValue })
            if (r.success) {
                dataC.money -= withdrawValue;
                dataC.moneyLogs = [{date: new Date(), type: 3, data: [withdrawValue, dataC.char_id]}].concat(dataC.moneyLogs)
                loadMoneyPage();
            };
        }
    };
}
    
/*${ dataC.upgrades.find(el => el == k) ? 'Adquirido' : v.request != "" ? dataC.upgrades.find(el => el == v.request) ? 'R$' + v.price : "Upgrade necessario!" : 'R$' + v.price }*/