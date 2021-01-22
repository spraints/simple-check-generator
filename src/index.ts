import { Probot, Context } from "probot";
import { EventPayloads } from "@octokit/webhooks";

export = (app: Probot) => {
  app.on("push", async (context: Context<EventPayloads.WebhookPayloadPush>) => {
    if (context.payload.deleted) {
      return;
    }
    const statusArgs1 = context.repo({sha: context.payload.after, context: "great-app"});
    const statusArgs2 = context.repo({sha: context.payload.after, context: "great-app-2"});
    const statusArgs3 = context.repo({sha: context.payload.after, context: "great-app-3"});
    await context.octokit.repos.createCommitStatus({state: "pending", description: "started 1", ...statusArgs1});
    await context.octokit.repos.createCommitStatus({state: "pending", description: "started 2", ...statusArgs2});
    await context.octokit.repos.createCommitStatus({state: "pending", description: "started 3", ...statusArgs3});
    await delay(10000);
    await context.octokit.repos.createCommitStatus({state: "success", description: "AOK BOSS 1", ...statusArgs1});
    context.octokit.repos.createCommitStatus({state: "failure", description: "AOK BOSS 2", ...statusArgs2});
    context.octokit.repos.createCommitStatus({state: "success", description: "AOK BOSS 3", ...statusArgs3});
  });
};

function delay(ms: number) {
  return new Promise( resolve => setTimeout(resolve, ms) );
}
