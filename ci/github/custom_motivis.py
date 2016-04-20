import os
import sys
from github import Github
from github.GithubException import GithubException

def determine_if_motivisci_committed():
    ORG_NAME=os.environ.get('GITHUB_ORG_NAME')
    REPO_NAME=os.environ.get('GITHUB_REPO_NAME')
    USERNAME=os.environ.get('GITHUB_USERNAME')
    PASSWORD=os.environ.get('GITHUB_PASSWORD')
    CI_BRANCH=os.environ.get('CI_BRANCH')

    g = Github(USERNAME,PASSWORD)

    try:
        org = g.get_organization(ORG_NAME)
    except:
        org = g.get_user(ORG_NAME)
    repo = org.get_repo(REPO_NAME)
    
    currentbranch = repo.get_branch(CI_BRANCH)
    
    exception = None
    dobuild = True
    if currentbranch.commit.commit.author.name == 'motivisci':
        dobuild = False
    #print 'The latest commit author was %s, so are we doing this build?  %s ' %  (currentbranch.commit.commit.author.name, dobuild)
    print dobuild

if __name__ == '__main__':
    try:
        determine_if_motivisci_committed()
    except:
        import traceback
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print '-'*60
        traceback.print_exception(exc_type, exc_value, exc_traceback, file=sys.stdout)
        print '-'*60
        sys.exit(1)