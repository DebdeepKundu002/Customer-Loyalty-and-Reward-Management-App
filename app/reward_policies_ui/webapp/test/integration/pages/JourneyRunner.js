sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"rewardpoliciesui/test/integration/pages/RewardPoliciesList.gen",
	"rewardpoliciesui/test/integration/pages/RewardPoliciesObjectPage.gen"
], function (JourneyRunner, RewardPoliciesListGenerated, RewardPoliciesObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('rewardpoliciesui') + '/test/flp.html#app-preview',
        pages: {
			onTheRewardPoliciesListGenerated: RewardPoliciesListGenerated,
			onTheRewardPoliciesObjectPageGenerated: RewardPoliciesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

