import { Probot, Context } from "probot";
import { EventPayloads } from "@octokit/webhooks";

export = (app: Probot) => {
  app.on("push", async (context: Context<EventPayloads.WebhookPayloadPush>) => {
    if (context.payload.deleted) {
      return;
    }
    const statusArgs = context.repo({sha: context.payload.after, context: "great-app"});
    await context.octokit.repos.createCommitStatus({state: "pending", description: "started", ...statusArgs});
    await delay(10000);
    await context.octokit.repos.createCommitStatus({state: "success", description: "AOK BOSS", ...statusArgs});
  });
};

function delay(ms: number) {
  return new Promise( resolve => setTimeout(resolve, ms) );
}
