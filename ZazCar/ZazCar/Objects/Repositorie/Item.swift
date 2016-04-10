//
//  Item.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/10/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import ObjectMapper

class Item :Mappable {
    var id: Int?
    var name: String?
    var full_name: String?
    var keysUrl: String?
    var statusesUrl: String?
    var issuesUrl: String?
    var score: Double?
    var issueEventsUrl: String?
    var eventsUrl: String?
    var subscriptionUrl: String?
    var watchers: Double?
    var gitCommitsUrl: String?
    var subscribersUrl: String?
    var cloneUrl: String?
    var hasWiki: Bool?
    var pullsUrl: String?
    var url: String?
    var fork: Bool?
    var notificationsUrl: String?
    var internalBaseClassDescription: String?
    var collaboratorsUrl: String?
    var deploymentsUrl: String?
    var languagesUrl: String?
    var hasIssues: Bool?
    var commentsUrl: String?
    var privateProperty: Bool?
    var size: Double?
    var gitTagsUrl: String?
    var updatedAt: String?
    var sshUrl: String?
    var archiveUrl: String?
    var openIssuesCount: Double?
    var milestonesUrl: String?
    var blobsUrl: String?
    var contributorsUrl: String?
    var contentsUrl: String?
    var forksCount: Double?
    var treesUrl: String?
    var mirrorUrl: AnyObject?
    var hasDownloads: Bool?
    var createdAt: String?
    var forksUrl: String?
    var svnUrl: String?
    var commitsUrl: String?
    var homepage: String?
    var teamsUrl: String?
    var branchesUrl: String?
    var issueCommentUrl: String?
    var mergesUrl: String?
    var gitRefsUrl: String?
    var gitUrl: String?
    var forks: Double?
    var openIssues: Double?
    var hooksUrl: String?
    var htmlUrl: String?
    var stargazersUrl: String?
    var assigneesUrl: String?
    var compareUrl: String?
    var tagsUrl: String?
    var releasesUrl: String?
    var stargazersCount: Double?
    var pushedAt: String?
    var labelsUrl: String?
    var downloadsUrl: String?
    var watchersCount: Double?
    var language: String?
    var hasPages: Bool?
    var defaultBranch: String?
    
    var owner: Owner?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id        <- map["id"]
        name      <- map["name"]
        full_name <- map["full_name"]
        keysUrl        <- map["keys_url"]
        statusesUrl      <- map["statuses_url"]
        issuesUrl <- map["issues_url"]
        score        <- map["score"]
        issueEventsUrl      <- map["issue_events_url"]
        eventsUrl <- map["events_url"]
        subscriptionUrl        <- map["subscription_url"]
        watchers      <- map["watchers"]
        gitCommitsUrl <- map["git_commits_url"]
        subscribersUrl        <- map["subscribers_url"]
        cloneUrl      <- map["clone_url"]
        hasWiki <- map["has_wiki"]
        pullsUrl        <- map["pulls_url"]
        url      <- map["url"]
        fork <- map["fork"]
        notificationsUrl        <- map["notifications_url"]
        internalBaseClassDescription      <- map["internalBaseClassDescription"]
        collaboratorsUrl <- map["collaborators_url"]
        deploymentsUrl        <- map["deployments_url"]
        languagesUrl      <- map["languages_url"]
        hasIssues <- map["has_issues"]
        commentsUrl        <- map["comments_url"]
        privateProperty      <- map["private"]
        size <- map["size"]
        gitTagsUrl        <- map["git_tags_url"]
        updatedAt      <- map["updated_at"]
        sshUrl <- map["ssh_url"]
        archiveUrl        <- map["archive_url"]
        openIssuesCount      <- map["open_issues_count"]
        full_name <- map["full_name"]
        milestonesUrl      <- map["milestones_url"]
        blobsUrl <- map["blobs_url"]
        contributorsUrl        <- map["contributors_url"]
        contentsUrl      <- map["contents_url"]
        forksCount <- map["forks_count"]
        treesUrl        <- map["trees_url"]
        mirrorUrl      <- map["mirror_url"]
        hasDownloads <- map["has_downloads"]
        createdAt        <- map["created_at"]
        forksUrl      <- map["forks_url"]
        svnUrl <- map["svn_url"]
        commitsUrl        <- map["commits_url"]
        homepage      <- map["homepage"]
        teamsUrl <- map["teams_url"]
        branchesUrl        <- map["branches_url"]
        issueCommentUrl      <- map["issue_comment_url"]
        mergesUrl <- map["merges_url"]
        gitRefsUrl      <- map["git_refs_url"]
        gitUrl <- map["git_url"]
        forks        <- map["forks"]
        openIssues      <- map["open_issues"]
        hooksUrl <- map["hooks_url"]
        htmlUrl        <- map["html_url"]
        stargazersUrl      <- map["stargazers_url"]
        assigneesUrl <- map["assignees_url"]
        compareUrl      <- map["compare_url"]
        tagsUrl <- map["tags_url"]
        releasesUrl        <- map["releases_url"]
        stargazersCount      <- map["stargazers_count"]
        pushedAt <- map["pushed_at"]
        labelsUrl      <- map["labels_url"]
        downloadsUrl <- map["downloads_url"]
        watchersCount        <- map["watchers_count"]
        language      <- map["language"]
        hasPages <- map["has_pages"]
        defaultBranch      <- map["default_branch"]
        owner <- map["owner"]
    }
}
