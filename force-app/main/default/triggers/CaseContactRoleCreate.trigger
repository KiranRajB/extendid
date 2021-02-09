trigger CaseContactRoleCreate on Case (after update) {
    CaseContactRole csr = new CaseContactRole();
    csr.id='';
    csr.CasesId='5002w000006poe6';
    csr.ContactId='0032w00000EE0oM';
    if(csr.id!=null)csr.id='';
    //Test New File
    upsert csr;
    system.debug('*************'+csr.id);
}