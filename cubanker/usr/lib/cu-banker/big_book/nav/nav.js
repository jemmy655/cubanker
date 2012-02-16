function create_menu(basepath)
{
	var base = (basepath == 'null') ? '' : basepath;

	document.write(
'<table cellpadding="0" cellspacing="10" border="0" width="100%"> <tr><td valign="top" width="25%">' +
'<h3>Basic Info</h3>' +
'<ul>' +
	'<li><a href="#'+base+'">Introducing CommunityBanker</a></li>' + 
	'<li><a href="'+base+'licenses.html">Applicable Licenses</a></li>' + 
	'<li><a href="'+base+'changelog.html">Change Log</a></li>' + 
	'<li><a href="'+base+'credits.html">Credits</a></li>' +
	'<li><a href="'+base+'universitycollaboration.html">University Collaboration Programme</a></li>' + 
'</ul>' + 

'<span title="If you are already familiar with the concepts associated with a credit union,' + 
'open source and banking systems then this section is probably worth skipping,' + 
'but it is included here to aid community banks and their staff to ' +
'achieve a common understanding of these concepts." style="cursor: help;">' +
'<h3 >Concepts</a></h3></span>' +
'<ul>' +
	'<li><a href="'+base+'concepts/understandingopensource.html">Understanding Open Source</a></li>' + 
	'<li><a href="'+base+'concepts/understandingcreditunions.html">Understanding Credit Unions</a></li>' + 
	'<li><a href="'+base+'concepts/understandingtransactionsecurity.html">Understanding Transaction Security</a></li>' + 
	'<li><a href="'+base+'concepts/understandingbankservices.html">Understanding Bank Services</a></li>' + 
	'<li><a href="'+base+'concepts/understandingbankrisk.html">Understanding Bank Risk</a></li>' + 
	'<li><a href="'+base+'concepts/understandingbankcompliance.html">Understanding Bank Compliance</a></li>' + 
	'<li><a href="#'+base+'concepts/understandingbankoperations.html">Understanding Bank Operations</a></li>' + 
	'<li><a href="'+base+'concepts/commonacronyms.html">Common Acronyms</a></li>' + 

'</td>'+
'<td valign="top" width="25%">' +

'<h3>Easy Installation</h3>' +
'<ul>' +
   '<li><a href="'+base+'installation/serversetup.html">Server Setup</a></li>' + 	
	'<li><a href="#'+base+'installation/installation.html">Installation</a></li>' + 
	'<li><a href="#'+base+'installation/configuration.html">Configuration</a></li>' + 
'</ul>' +

'<h3>Co-operative Banking</h3>' +
'<ul>' +
	'<li><a href="#'+base+'overview/gettingstarted.html">Getting Started</a></li>' + 
	'<li><a href="#'+base+'overview/commonbond.html">Common Bond</a></li>' + 	
	'<li><a href="#'+base+'overview/ataglance.html">Operations at a Glance</a></li>' + 
	'<li><a href="#'+base+'overview/roles.html">Roles & Leadership</a></li>' + 
	'<li><a href="#'+base+'overview/credit.html">Credit</a></li>' + 
	'<li><a href="#'+base+'overview/supervision.html">Supervision & Audit</a></li>' + 
	'<li><a href="#'+base+'overview/education.html">Education Committee</a></li>' + 
	'<li><a href="#'+base+'overview/reserves.html">Reserves</a></li>' + 
	'<li><a href="#'+base+'overview/surplus.html">Surplus & Dividends</a></li>' + 
	'<li><a href="#'+base+'overview/deposits.html">Deposits & Investments</a></li>' + 
	'<li><a href="#'+base+'overview/financialplanning.html">Financial Planning & Budgeting</a></li>' + 
	'<li><a href="#'+base+'overview/performance.html">Performance Analysis</a></li>' + 
'</ul>' +

'</td>' +
'<td valign="top" width="25%">' +

'<h3>User Guide</h3>' +
'<ul>' +
	'<li><a href="#'+base+'userguide/toc.html">User Guide - TOC</a></li>' + 
	'<li><a href="#'+base+'userguide/usermanagement.html">User Management</a></li>' + 	
	'<li><a href="#'+base+'userguide/bankconfiguration.html">Bank Configuration</a></li>' + 
	'<li><a href="#'+base+'userguide/fica.html">FICA/KYC</a></li>' + 
	'<li><a href="#'+base+'userguide/accounts.html">Accounts</a></li>' + 
	'<li><a href="#'+base+'userguide/loans.html">Loans</a></li>' + 
	'<li><a href="#'+base+'userguide/collections.html">Collections</a></li>' + 
	'<li><a href="#'+base+'userguide/transactions.html">Transactions</a></li>' + 
	'<li><a href="#'+base+'userguide/accounting.html">Accounting</a></li>' + 
	'<li><a href="#'+base+'userguide/reconciliation.html">Reconciliation</a></li>' + 
	'<li><a href="#'+base+'userguide/reporting.html">Reporting</a></li>' + 
	'<li><a href="#'+base+'userguide/webbank.html">webBANK&trade</a></li>' + 
	'<li><a href="#'+base+'userguide/callcentre.html">callCENTRE&trade</a></li>' + 
	'<li><a href="#'+base+'userguide/webbranch.html">webBRANCH&trade</a></li>' + 
	'<li><a href="#'+base+'userguide/audit.html">Audit</a></li>' + 
'</ul>' +
'</td>' +
'<td valign="top" width="25%">' +

'<h3>Developer Resources</h3>' +
'<ul>' +
'<li><a href="'+base+'development/development.html">Development</a></li>' + 
'<li><a href="'+base+'development/codingconventions.html">Coding Conventions</a></li>' + 
'<li><a href="#'+base+'development/coding_examples.html">Coding Examples</a></li>' + 
'<li><a href="'+base+'development/database.html">Database</a></li>' + 
'<li><a href="#'+base+'development/uml.html">UML Design Documentation</a></li>' + 
'<li><a href="#'+base+'development/functional_specification.html">Functional Specification</a></li>' + 
'</ul>' + 	

'<h3>Additional Resources</h3>' +
'<ul>' +
'<li><a href="http://groups.google.co.za/group/bank-builders" target="_blank">Google Group</a></li>' + 
'<li><a href="http://cubanker.kicks-ass.org/webbank/main/login" target="_blank" >Demo - webBANK&trade</a></li>' + 
'</ul>' +

'</td></tr></table>');
}
