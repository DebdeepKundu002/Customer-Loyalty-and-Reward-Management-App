sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"retailstuffui/test/integration/pages/TransactionsList.gen",
	"retailstuffui/test/integration/pages/TransactionsObjectPage.gen"
], function (JourneyRunner, TransactionsListGenerated, TransactionsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('retailstuffui') + '/test/flp.html#app-preview',
        pages: {
			onTheTransactionsListGenerated: TransactionsListGenerated,
			onTheTransactionsObjectPageGenerated: TransactionsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

