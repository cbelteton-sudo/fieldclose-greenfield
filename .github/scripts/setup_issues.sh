#!/bin/bash

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) could not be found. Please install it first."
    exit 1
fi

# Check authentication
if ! gh auth status &> /dev/null; then
    echo "You are not logged in to GitHub CLI. Please run 'gh auth login'."
    exit 1
fi

REPO_owner="{owner}" # Replace with actual owner if needed, but gh usually infers from context
REPO_NAME="{repo}"

echo "Setting up repository labels..."
# Labels
gh label create "type:bug" --color "d73a4a" --description "Something isn't working" --force
gh label create "type:feature" --color "a2eeef" --description "New feature or request" --force
gh label create "type:chore" --color "bfdadc" --description "Routine tasks, refactoring, etc." --force
gh label create "area:frontend" --color "1d76db" --description "Frontend related" --force
gh label create "area:backend" --color "0052cc" --description "Backend related" --force
gh label create "area:devops" --color "5319e7" --description "DevOps related" --force
gh label create "area:qa" --color "c5def5" --description "QA related" --force
gh label create "area:spec" --color "f9d0c4" --description "Specification related" --force
gh label create "priority:p0" --color "b60205" --description "Critical priority" --force
gh label create "priority:p1" --color "d93f0b" --description "High priority" --force
gh label create "priority:p2" --color "fbca04" --description "Medium priority" --force
gh label create "status:blocked" --color "000000" --description "Blocked" --force
gh label create "status:ready" --color "0e8a16" --description "Ready to start" --force
gh label create "status:in-progress" --color "fbca04" --description "Currently being worked on" --force

echo "Setting up milestones..."
# Milestones
gh api repos/:owner/:repo/milestones -f title="v0.1 MVP" -f description="S1 core demo"
gh api repos/:owner/:repo/milestones -f title="v0.2 Evidence/Offline" -f description="S2 Evidence/Offline"
gh api repos/:owner/:repo/milestones -f title="v0.3 Exec Dashboard/PDF" -f description="S3 Dashboard/PDF"

echo "Creating initial issues..."
# S1: Auth
gh issue create --title "S1: Auth Implementation" --body "Implement initial authentication flow." --label "type:feature,area:backend,priority:p0" --milestone "v0.1 MVP"
# S1: Hoy/Reportar
gh issue create --title "S1: Hoy/Reportar UI" --body "Implement Today/Report reporting UI." --label "type:feature,area:frontend,priority:p0" --milestone "v0.1 MVP"
# ... other issues ...
gh issue create --title "S1: Timeline View" --body "Implement project timeline view." --label "type:feature,area:frontend,priority:p1" --milestone "v0.1 MVP"
gh issue create --title "S1: Review Inbox" --body "Implement review inbox for managers." --label "type:feature,area:frontend,priority:p1" --milestone "v0.1 MVP"
gh issue create --title "S1: Infra Baseline" --body "Setup initial infrastructure (Docker, DB)." --label "type:chore,area:devops,priority:p0" --milestone "v0.1 MVP"
gh issue create --title "S1: CI Pipeline" --body "Finalize CI pipeline (Actions)." --label "type:chore,area:devops,priority:p0" --milestone "v0.1 MVP"

# S2
gh issue create --title "S2: Presign/MinIO" --body "Implement file upload presigning with MinIO." --label "type:feature,area:backend,priority:p1" --milestone "v0.2 Evidence/Offline"
gh issue create --title "S2: Upload UI" --body "Implement file upload UI." --label "type:feature,area:frontend,priority:p1" --milestone "v0.2 Evidence/Offline"
gh issue create --title "S2: Offline Queue" --body "Implement offline queue for requests." --label "type:feature,area:frontend,priority:p1" --milestone "v0.2 Evidence/Offline"
gh issue create --title "S2: Sync States" --body "Implement data synchronization states." --label "type:feature,area:frontend,priority:p1" --milestone "v0.2 Evidence/Offline"

# S3
gh issue create --title "S3: Punch List" --body "Implement project punch list." --label "type:feature,area:frontend,priority:p2" --milestone "v0.3 Exec Dashboard/PDF"
gh issue create --title "S3: Executive Dashboard" --body "Implement executive dashboard." --label "type:feature,area:frontend,priority:p2" --milestone "v0.3 Exec Dashboard/PDF"
gh issue create --title "S3: PDF Reports" --body "Implement PDF generation for reports." --label "type:feature,area:backend,priority:p2" --milestone "v0.3 Exec Dashboard/PDF"

echo "Setup complete!"
