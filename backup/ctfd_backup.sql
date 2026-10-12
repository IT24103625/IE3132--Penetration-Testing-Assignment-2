/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ctfd
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES
('f63a9205d72f');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience_members`
--

DROP TABLE IF EXISTS `audience_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audience_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_audience_team` (`audience_id`,`team_id`),
  UNIQUE KEY `uq_audience_user` (`audience_id`,`user_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `audience_members_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audiences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `audience_members_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `audience_members_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience_members`
--

LOCK TABLES `audience_members` WRITE;
/*!40000 ALTER TABLE `audience_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `audience_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences`
--

DROP TABLE IF EXISTS `audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences`
--

LOCK TABLES `audiences` WRITE;
/*!40000 ALTER TABLE `audiences` DISABLE KEYS */;
/*!40000 ALTER TABLE `audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `category` varchar(80) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `type` varchar(80) DEFAULT 'standard',
  PRIMARY KEY (`id`),
  KEY `awards_ibfk_1` (`team_id`),
  KEY `awards_ibfk_2` (`user_id`),
  CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brackets`
--

DROP TABLE IF EXISTS `brackets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brackets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brackets`
--

LOCK TABLES `brackets` WRITE;
/*!40000 ALTER TABLE `brackets` DISABLE KEYS */;
/*!40000 ALTER TABLE `brackets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_topics`
--

DROP TABLE IF EXISTS `challenge_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `challenge_topics_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `challenge_topics_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_topics`
--

LOCK TABLES `challenge_topics` WRITE;
/*!40000 ALTER TABLE `challenge_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenge_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `max_attempts` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `category` varchar(80) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `state` varchar(80) NOT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `connection_info` text DEFAULT NULL,
  `next_id` int(11) DEFAULT NULL,
  `attribution` text DEFAULT NULL,
  `logic` varchar(80) NOT NULL,
  `initial` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `decay` int(11) DEFAULT NULL,
  `function` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `module_id` int(11) DEFAULT NULL,
  `scheduled_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `next_id` (`next_id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`next_id`) REFERENCES `challenges` (`id`) ON DELETE SET NULL,
  CONSTRAINT `challenges_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES
(1,'PULSE-04 The Vulnerable Patient Portal','**The MedCore patient portal was identified during the investigation.**\r\n\r\nDuring a routine security review, analysts discovered that developers may have left useful information within the application.\r\n\r\n**Objective:**\r\n\r\nAccess the patient portal, perform basic application assessment, discover the hidden analyst note, and recover the challenge flag.\r\n\r\n**Portal URL:**\r\nhttp://127.0.0.1:5000\r\n\r\n**Credentials:**\r\n\r\nUsername: patient1\r\nPassword: Welcome123',0,250,'Web Security','standard','visible','{\"prerequisites\": [4, 5, 6], \"anonymize\": false}',NULL,7,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(2,'PULSE-08 MedCore DB-SOC Incident Investigation','Operation PulseLock\r\n\r\nThe MedCore Database Security Operations Center (DB-SOC) received five high-severity database alerts during the same operational period.\r\n\r\nNot every alert represents malicious activity.\r\n\r\nSome alerts may have been caused by:\r\n\r\n• Application issues\r\n• Approved service activity\r\n• Network failover events\r\n• Authorized database maintenance\r\n• Genuine unauthorized database access\r\n\r\nYour task is to act as a Database Security Analyst.\r\n\r\nReview all supplied evidence and determine:\r\n\r\n1. Which alerts are legitimate?\r\n2. Which alert requires escalation?\r\n3. What is the root cause of each alert?\r\n4. Which account was involved in the security incident?\r\n5. Which sensitive database object was accessed?\r\n6. How many rows were exported?\r\n\r\nConstruct the final flag using:\r\n\r\nPULSE{ALERTID_ACCOUNT_OBJECT_ROWS}\r\n\r\nAll values must be UPPERCASE.\r\n\r\nExample:\r\n\r\nPULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}',0,600,'Database Security','standard','visible','{\"prerequisites\": [1, 4, 5, 6, 7, 8, 9], \"anonymize\": false}',NULL,3,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(3,'PULSE-09 Research Agent Analysis','Operation PulseLock\r\n\r\nDuring the breach investigation, security analysts recovered an internal utility from a contractor workstation.\r\n\r\nThe application appears to require an authorization key before revealing restricted information.\r\n\r\nYour objective is to:\r\n\r\n* Analyze the executable\r\n* Understand how authorization is validated\r\n* Recover the correct authorization key\r\n* Unlock the hidden functionality\r\n* Obtain the challenge flag\r\n\r\nChallenge File:\r\n\r\nresearch_agent.exe',0,300,'Reverse Engineering','standard','visible','{\"prerequisites\": [1, 2, 4, 5, 6, 7, 8, 9], \"anonymize\": false}',NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(4,'PULSE-01 The Public Footprint','A fictional hospital research project has unintentionally exposed information through its public-facing website and published documents.\r\nInvestigate the available public pages, staff information, launch announcement, and supplied PDF document. Correlate the information you discover and inspect relevant document metadata to identify the internal project code and the first investigation indicator.\r\nYour Task\r\nReview the supplied public website and related pages.\r\nCorrelate repeated identifiers and project-related information.\r\nInspect the supplied PDF\'s properties and metadata.\r\nSubmit the flag you discover.\r\nTools: Web browser, PDF metadata/properties viewer, and basic information-gathering tools.\r\n\r\nflag format : PULSE{clue}',0,100,'OSINT','standard','visible',NULL,NULL,5,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(5,'PULSE-02 The Hidden Campaign File','Scenario\r\nA hospital campaign image was recovered during an investigation into suspicious attacker communication. Although the image appears normal, investigators suspect that hidden information is embedded within it.\r\n \r\nYour Task\r\n1. Download the supplied hospital campaign image.\r\n2. Identify its file type and inspect its metadata.\r\n3. Investigate possible hidden information using forensic tools.\r\n4. Use the project code discovered in PL-01 as a passphrase clue.\r\n5. Extract the hidden note and recover the PL-02 flag.\r\n6. Recover the next-stage ciphertext for PL-03.\r\n \r\nRecommended Tools\r\nfile, strings, ExifTool, binwalk, steghide\r\n \r\n**Flag format:** PULSE{...}\r\n \r\nSubmit your recovered flag through CTFd.',0,100,'Steganography','standard','visible','{\"prerequisites\": [4], \"anonymize\": false}',NULL,6,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(6,'PULSE-03 Encrypted Attacker Note','Investigators recovered an encrypted note during the smart hospital breach investigation. Analyze the provided ciphertext and recover the original message to uncover evidence left by the attacker.',0,200,'Cryptography','standard','visible','{\"prerequisites\": [4, 5], \"anonymize\": false}',NULL,1,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(7,'PULSE-05 Compromised Linux Host','A Linux host used by a fictional medical research organization may have been compromised. Investigators have collected system evidence, including authentication events, account information, service configuration, scheduled tasks, and a protected research artefact.\r\nAnalyze the available evidence to determine how the attacker gained access, identify the suspicious account and persistence mechanism, and establish which protected artefact was targeted.\r\n**Your Task**\r\nInvestigate the authentication logs and identify suspicious access.\r\nIdentify the suspicious user account.\r\nExamine services and scheduled tasks for persistence mechanisms.\r\nReview file permissions and the protected research artefact.\r\nUse the provided investigation evidence to recover and submit the flag.\r\n**Tools:** Linux command line, log-analysis tools, and basic system investigation commands.',0,300,'Linux/System Security','standard','visible','{\"prerequisites\": [1, 4, 5, 6], \"anonymize\": false}',NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(8,'PULSE-06 Forensic Timeline Reconstruction','Scenario\r\nFollowing a suspected security breach at MedCore Hospital, investigators recovered authentication logs, web server access logs, and file activity records.\r\n \r\nThe security team suspects that an attacker gained unauthorized access to a research account, accessed sensitive research information, and attempted to conceal their activities.\r\n \r\nYour role is to act as a digital forensic investigator and reconstruct the incident timeline using the supplied evidence.\r\n \r\nLearning Objectives\r\n- Analyze authentication, web access, and file activity logs.\r\n- Correlate events across multiple evidence sources.\r\n- Normalize timestamps to UTC.\r\n- Identify suspicious account activity and file operations.\r\n- Reconstruct the sequence of events using forensic evidence.\r\n \r\nYour Tasks\r\n1. Download and extract `PL-06-Evidence.zip`.\r\n2. Identify the first confirmed successful SSH login.\r\n3. Determine the affected user account and source IP address.\r\n4. Identify when the research export file was created.\r\n5. Investigate suspicious file uploads and deletions.\r\n6. Reconstruct the incident timeline in chronological order.\r\n7. Support your findings using evidence from multiple logs.\r\n \r\nProvided Evidence\r\n- `auth.log` – Authentication events\r\n- `access.log` – Web server activity\r\n- `file_activity.csv` – File operations\r\n- `evidence_notes.txt` – Investigation instructions\r\n \r\nRecommended Tools\r\nLinux terminal, grep, awk, sort, Python, and spreadsheet software.\r\n \r\nSubmission\r\nAnalyze the forensic evidence and recover the challenge flag.\r\n \r\n**Flag Format:** `PULSE{...}`\r\n \r\nImportant\r\nPreserve the original evidence files. Perform your analysis on local copies and use the supplied SHA-256 checksum to verify evidence integrity.\r\nTimeline Verification\r\n \r\nAfter analyzing the forensic evidence, open the [PL-06 Timeline Verifier](http://localhost:5050).\r\n \r\nEnter your five forensic findings and click **Verify Timeline**.\r\n \r\nIf the timeline is correct, you will receive the PL-06 flag. Submit that flag in CTFd to complete the challenge.',0,350,'Digital Forensics','standard','visible','{\"prerequisites\": [1, 4, 5, 6, 7], \"anonymize\": false}',NULL,9,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(9,'PULSE-07 The Exfiltration Trail','Investigators recovered a packet capture from the smart hospital network. Analyze the traffic to identify the suspicious outbound connection and determine whether sensitive research data was exfiltrated.',0,400,'Network Forensics','standard','visible','{\"prerequisites\": [1, 4, 5, 6, 7, 8], \"anonymize\": false}',NULL,2,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL);
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `page_id` (`page_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES
(1,'ctf_version','3.8.8'),
(2,'dynamic_challenges_alembic_version','93284ed9c099'),
(3,'ctf_name','operational PulseLock'),
(4,'ctf_description','smart Hospital and research Database breach investigation CTF'),
(5,'user_mode','users'),
(6,'ctf_theme','core'),
(7,'start',''),
(8,'end',''),
(9,'freeze',NULL),
(10,'challenge_visibility','public'),
(11,'registration_visibility','public'),
(12,'score_visibility','public'),
(13,'account_visibility','public'),
(14,'verify_emails','false'),
(15,'social_shares','true'),
(16,'team_size','4'),
(17,'mail_server',NULL),
(18,'mail_port',NULL),
(19,'mail_tls',NULL),
(20,'mail_ssl',NULL),
(21,'mail_username',NULL),
(22,'mail_password',NULL),
(23,'mail_useauth',NULL),
(24,'setup','1'),
(25,'version_latest',NULL),
(26,'next_update_check','1791753425');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_challenge`
--

DROP TABLE IF EXISTS `dynamic_challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_challenge` (
  `id` int(11) NOT NULL,
  `dynamic_initial` int(11) DEFAULT NULL,
  `dynamic_minimum` int(11) DEFAULT NULL,
  `dynamic_decay` int(11) DEFAULT NULL,
  `dynamic_function` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dynamic_challenge_ibfk_1` FOREIGN KEY (`id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_challenge`
--

LOCK TABLES `dynamic_challenge` WRITE;
/*!40000 ALTER TABLE `dynamic_challenge` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_entries`
--

DROP TABLE IF EXISTS `field_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`)),
  `field_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `field_entries_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_entries_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_entries_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_entries`
--

LOCK TABLES `field_entries` WRITE;
/*!40000 ALTER TABLE `field_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `field_type` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `sha1sum` varchar(40) DEFAULT NULL,
  `solution_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `files_ibfk_1` (`challenge_id`),
  KEY `files_ibfk_3` (`solution_id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`),
  CONSTRAINT `files_ibfk_3` FOREIGN KEY (`solution_id`) REFERENCES `solutions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(6,'challenge','102cf73594947536bc2fdb60d19b9463/application_incidents.csv',2,NULL,'9634bfbee250db253436d869e916890760ec2491',NULL),
(7,'challenge','a0b729748fe13bda9c84b0e25c369e59/database_activity.csv',2,NULL,'53f4227cf9f150ec302fb142eae511964d40eabd',NULL),
(8,'challenge','2c08a0247bfeee35e8dbc36e0bb026cd/db_soc_alerts.csv',2,NULL,'8ee0d6abdc7dff8fbfacb8a74f54c92641024801',NULL),
(9,'challenge','d4960851a77506e977dec8223e9c5b29/investigation_instructions.txt',2,NULL,'b9945fa498b62fe7a18fd81a32bac5c9415de70f',NULL),
(10,'challenge','844061404c37998e011f33194f8b2e91/maintenance_approvals.csv',2,NULL,'d2f50fd332a4449c9918be8463f341274cb615e6',NULL),
(11,'challenge','6ac85f35996f8e391a248aeb8bc190e3/network_events.csv',2,NULL,'09988f6a5f4993e3a3d466a40ddc9f78b73d580f',NULL),
(12,'challenge','b7932914519992d70b350733930d1998/privileged_access.csv',2,NULL,'92de0033e0e4572f7ed3ade6bcc80449da8a3cd1',NULL),
(13,'challenge','705f3889dd467c13abedca755aafff0e/sensitive_objects.csv',2,NULL,'aec1dc2620219f3a8b7baec2860278bb38daca26',NULL),
(14,'challenge','765dd714b988f8b9a4bb7a16ee2229d5/service_account_register.csv',2,NULL,'3d3bea2b4dde95ce7169eb963b7ddbdb191cb71c',NULL),
(15,'challenge','341d5c82c52b2672e666e57fd968bb2d/research_agent.exe',3,NULL,'9e41415a15711dfa1a4b0aeb0b297f5bdfa11486',NULL),
(17,'challenge','24c0669245cabaa3e3366a4924d91fb3/SHA256SUMS.txt',5,NULL,'7904ede8ad5040c92851fbcdf4879f92bc103a91',NULL),
(18,'challenge','87f02a35f6bcb13feca05f0697e3b9dd/hospital_campaign_stego.jpeg',5,NULL,'5c0a0131c6e8dbab5f8fb2724e0d7f31b7e2832c',NULL),
(19,'challenge','92a55202b56357d503a1a5dd3d8d5101/ciphertext.txt',6,NULL,'b981a436f24ae8a090a1b19d0c00e0c66ce6e472',NULL),
(20,'challenge','9c1cfa5a9c67030aff838cf4d3814848/PL-06-Evidence.zip',8,NULL,'8a6ab600e12c23775e6183bff2465782af34fd07',NULL),
(21,'challenge','f57721dc80f49fb1bebc8ee3827b6bf8/SHA256SUMS.txt',8,NULL,'be6a642046f871707aba2ece8ce9b3eacaf4d562',NULL),
(22,'challenge','49f17035fc3360f367b61c52777f2720/hospital_traffic.pcap',9,NULL,'7cc4e3d07c98fc148643bf623b4f07e698c89561',NULL),
(25,'challenge','568b999eb90a7b9af382ec41c907471e/PL1-fixed_1.zip',4,NULL,'6b74f92bec2211b1258afb542ed2a2228f9efdc9',NULL),
(26,'challenge','4c086b438c43f293ca7f3c51768be08f/PL-05-Compromised-Linux-Host-fixed.zip',7,NULL,'11f02e903ef7d0f4d62ae6bb1ad01d9c1d2a9928',NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_ibfk_1` (`challenge_id`),
  CONSTRAINT `flags_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES
(1,1,'static','PULSE{portal_access_confirmed}',''),
(2,2,'static','PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}',''),
(3,3,'static','PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}',''),
(4,4,'static','PULSE{public_trace_found}',''),
(5,5,'static','PULSE{hidden_campaign_revealed}',''),
(6,6,'static','PULSE{attacker_note_decoded}',''),
(7,7,'static','PULSE{host_compromise_found}',''),
(8,8,'static','PULSE{timeline_reconstructed}',''),
(9,9,'static','PULSE{exfiltration_confirmed}','');
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hints`
--

DROP TABLE IF EXISTS `hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `title` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hints_ibfk_1` (`challenge_id`),
  CONSTRAINT `hints_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hints`
--

LOCK TABLES `hints` WRITE;
/*!40000 ALTER TABLE `hints` DISABLE KEYS */;
INSERT INTO `hints` VALUES
(1,'standard',1,'Inspect the portal carefully after login.\nNot every clue is visible on the page itself.',5,'{\"prerequisites\": []}','Portal Investigation'),
(2,'standard',1,'Developers sometimes leave useful information inside the page source.\nReview the HTML carefully.',10,'{\"prerequisites\": [1]}','Developer Clue'),
(3,'standard',1,'There is a hidden route related to an analyst note.',15,'{\"prerequisites\": [2]}','Look Deeper'),
(4,'standard',2,'Do not assume every high-severity alert is malicious.\nCorrelate alerts with operational evidence.',5,'{\"prerequisites\": []}','Alert Correlation'),
(5,'standard',2,'Application incidents, approved services, network failovers, and maintenance records may explain several alerts.',10,'{\"prerequisites\": [4]}','Business Context'),
(6,'standard',2,'Focus on an expired account accessing a highly restricted object from an unapproved source.',15,'{\"prerequisites\": [4, 5]}','Access Review Correlation'),
(7,'standard',3,'The executable contains all validation logic required to recover the flag.',5,'{\"prerequisites\": []}','Program Logic'),
(8,'standard',3,'The authorization key is not stored directly as plain text.\nReview how individual characters are assembled.',10,'{\"prerequisites\": [7]}','String Construction'),
(9,'standard',3,'The correct key is generated at runtime from character values.',15,'{\"prerequisites\": [7, 8]}','Authorization Key'),
(13,'standard',4,'Compare the information available across the public website, staff pages, and launch announcement. Look for details that appear more than once.',5,'{\"prerequisites\": []}','Start with the public evidence'),
(14,'standard',4,'Open the supplied PDF\'s document properties. Check metadata fields such as the title, author, subject, and keywords for useful clues.',10,'{\"prerequisites\": [13]}','Inspect the PDF metadata'),
(15,'standard',4,'Correlate the repeated project-related wording across the website and PDF. Use those clues to identify the internal project code and the first investigation indicator.',15,'{\"prerequisites\": [13, 14]}','Look for repeated project identifiers'),
(16,'standard',5,'Start by examining the file metadata.',5,'{\"prerequisites\": []}','Metadata Inspection'),
(17,'standard',5,'Inspect beyond the visible pixels. Consider steganographic extraction tools.',10,'{\"prerequisites\": [16]}','Hidden Content'),
(18,'standard',5,'Reuse the project code discovered during Stage 1. It may be required to extract the hidden information.',15,'{\"prerequisites\": [16, 17]}','Stage 1 Project Code'),
(19,'standard',6,'The message may have been transformed more than once. Look closely at the ciphertext and consider common encoding methods before trying to decrypt it.',5,'{\"prerequisites\": []}','Identify the Layers'),
(20,'standard',6,'Try decoding the outer layer first. Base64 is a common way to represent encoded text, but decoding it may reveal another layer rather than the original message.',10,'{\"prerequisites\": [19]}','Start Outside'),
(21,'standard',6,'After decoding Base64, check whether the result uses a letter-substitution technique such as ROT13. If the text is still unreadable, investigate Vigenère decryption and look for the key mentioned in your investigation evidence.',15,'{\"prerequisites\": [19, 20]}','Reuse Earlier Evidence'),
(22,'standard',7,'Start with the authentication logs. Compare the suspicious login time with later account, service, scheduled-task, and file activity to establish the sequence of events.',5,'{\"prerequisites\": []}','Build a timeline of events'),
(23,'standard',7,'Look for unfamiliar services and scheduled tasks. Compare their names, executable paths, and associated accounts to determine which mechanisms may have been used to maintain access.',10,'{\"prerequisites\": [22]}','Investigate persistence mechanisms'),
(24,'standard',7,'Review the file\'s ownership, permissions, and location. Correlate this evidence with the suspicious account and persistence activity to determine which protected research artefact was targeted.',15,'{\"prerequisites\": [22, 23]}','Examine the protected artefact'),
(25,'standard',8,'Normalize all timestamps to UTC before comparing even.',5,'{\"prerequisites\": []}','Timestamp Normalization'),
(26,'standard',8,'Correlate authentication records with web access logs to identify the sequence of suspicious activity.',10,'{\"prerequisites\": [25]}','Log Correlation'),
(27,'standard',8,'Check file creation, upload, and deletion events after the successful login to reconstruct the incident timeline.',15,'{\"prerequisites\": [25, 26]}','File Activity'),
(28,'standard',9,'Open the provided PCAP file in Wireshark. Review the conversations and look for unusual outbound traffic between the hospital network and an external host.',5,'{\"prerequisites\": []}','Inspect the Traffic'),
(29,'standard',9,'Use Wireshark\'s Statistics → Conversations view to identify connections with unusual destinations or data volumes. Follow the relevant TCP stream to examine the exchanged data.',10,'{\"prerequisites\": [28]}','Follow the Suspicious Connection'),
(30,'standard',9,'Examine the suspicious stream\'s payload and look for readable application data or encoded content that indicates sensitive information was transferred. Use the recovered evidence to determine the flag.',15,'{\"prerequisites\": [28, 29]}','Find the Evidence of Exfiltration');
/*!40000 ALTER TABLE `hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_audience_access`
--

DROP TABLE IF EXISTS `module_audience_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_audience_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `audience_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_module_audience` (`module_id`,`audience_id`),
  KEY `audience_id` (`audience_id`),
  CONSTRAINT `module_audience_access_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audiences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `module_audience_access_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_audience_access`
--

LOCK TABLES `module_audience_access` WRITE;
/*!40000 ALTER TABLE `module_audience_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_audience_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `route` varchar(128) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `auth_required` tinyint(1) DEFAULT NULL,
  `format` varchar(80) DEFAULT NULL,
  `link_target` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route` (`route`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(1,'operational PulseLock','index','<div class=\"row\">\n    <div class=\"col-md-6 offset-md-3\">\n        <img class=\"w-100 mx-auto d-block\" style=\"max-width: 500px;padding: 50px;padding-top: 14vh;\" src=\"/themes/core/static/img/logo.png?d=59f2887e\" />\n        <h3 class=\"text-center\">\n            <p>A cool CTF platform from <a href=\"https://ctfd.io\">ctfd.io</a></p>\n            <p>Follow us on social media:</p>\n            <a href=\"https://twitter.com/ctfdio\"><i class=\"fab fa-twitter fa-2x\" aria-hidden=\"true\"></i></a>&nbsp;\n            <a href=\"https://facebook.com/ctfdio\"><i class=\"fab fa-facebook fa-2x\" aria-hidden=\"true\"></i></a>&nbsp;\n            <a href=\"https://github.com/ctfd\"><i class=\"fab fa-github fa-2x\" aria-hidden=\"true\"></i></a>\n        </h3>\n        <br>\n        <h4 class=\"text-center\">\n            <a href=\"admin\">Click here</a> to login and setup your CTF\n        </h4>\n    </div>\n</div>',0,NULL,NULL,'markdown',NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `review` varchar(2000) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`challenge_id`),
  KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solutions`
--

DROP TABLE IF EXISTS `solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `state` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `solutions_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solves`
--

DROP TABLE IF EXISTS `solves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solves` (
  `id` int(11) NOT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `challenge_id` (`challenge_id`,`team_id`),
  UNIQUE KEY `challenge_id_2` (`challenge_id`,`user_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`id`) REFERENCES `submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solves`
--

LOCK TABLES `solves` WRITE;
/*!40000 ALTER TABLE `solves` DISABLE KEYS */;
INSERT INTO `solves` VALUES
(2,3,1,NULL);
/*!40000 ALTER TABLE `solves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `ip` varchar(46) DEFAULT NULL,
  `provided` text DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES
(2,3,1,NULL,'172.19.0.1','PULSE{AGENT_ANALYSIS_COMPLETE}','correct','2026-10-11 12:49:50.525315'),
(3,5,2,NULL,'172.19.0.1','nmbnnm,','incorrect','2026-10-11 14:03:16.899493'),
(5,4,2,NULL,'172.19.0.1','public_trace_found','incorrect','2026-10-11 15:53:00.995374'),
(10,7,2,NULL,'172.19.0.1','PULSE{systemd_persistence_found}','incorrect','2026-10-11 16:05:51.178477'),
(15,3,2,NULL,'172.19.0.1','PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}','incorrect','2026-10-11 16:28:20.125333'),
(16,3,2,NULL,'172.19.0.1','PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}','incorrect','2026-10-11 16:28:21.402403'),
(17,3,2,NULL,'172.19.0.1','PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}','incorrect','2026-10-11 16:28:36.232684'),
(18,3,2,NULL,'172.19.0.1','PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}','incorrect','2026-10-11 16:28:37.445922'),
(19,3,2,NULL,'172.19.0.1','PULSE{DBA-2605_CONTRACTOR_READ_CLINICAL_TRIAL_RESULTS_4827}','incorrect','2026-10-11 16:28:38.719447'),
(21,4,2,NULL,'172.19.0.1','PULSE{public_trace_found }','incorrect','2026-10-11 16:50:47.692283');
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `value` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_ibfk_1` (`challenge_id`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `secret` varchar(128) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  `affiliation` varchar(128) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `captain_id` int(11) DEFAULT NULL,
  `bracket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_captain_id` (`captain_id`),
  KEY `bracket_id` (`bracket_id`),
  CONSTRAINT `team_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`bracket_id`) REFERENCES `brackets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `expiration` datetime(6) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `ip` varchar(46) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tracking_ibfk_1` (`user_id`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES
(3,NULL,'172.19.0.1',1,'2026-10-11 17:21:28.220907',NULL),
(4,NULL,'172.19.0.1',2,'2026-10-11 17:20:26.515438',NULL),
(5,'challenges.open','172.19.0.1',2,'2026-10-10 13:43:08.617374',1),
(6,'challenges.open','172.19.0.1',2,'2026-10-11 10:37:26.183974',2),
(7,'challenges.open','172.19.0.1',2,'2026-10-11 10:39:30.627539',3),
(8,'challenges.open','172.19.0.1',2,'2026-10-11 14:03:11.252285',5),
(9,'challenges.open','172.19.0.1',2,'2026-10-11 14:03:56.741966',8),
(10,'challenges.open','172.19.0.1',2,'2026-10-11 14:16:01.325365',4),
(11,NULL,'172.19.0.1',3,'2026-10-11 14:29:22.169127',NULL),
(12,'challenges.open','172.19.0.1',2,'2026-10-11 15:59:11.982550',6),
(13,'challenges.open','172.19.0.1',2,'2026-10-11 16:03:53.869522',7),
(14,'challenges.open','172.19.0.1',2,'2026-10-11 16:14:44.358552',9);
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unlocks`
--

DROP TABLE IF EXISTS `unlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `ip` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unlocks_ibfk_1` (`team_id`),
  KEY `unlocks_ibfk_2` (`user_id`),
  CONSTRAINT `unlocks_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `unlocks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unlocks`
--

LOCK TABLES `unlocks` WRITE;
/*!40000 ALTER TABLE `unlocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `unlocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `secret` varchar(128) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  `affiliation` varchar(128) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `bracket_id` int(11) DEFAULT NULL,
  `change_password` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_id` (`team_id`),
  KEY `bracket_id` (`bracket_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`bracket_id`) REFERENCES `brackets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,NULL,'Admin_Ishani','$bcrypt-sha256$v=2,t=2b,r=12$BPrMz1Hh0Lo7ZhOXYAxYMO$GaicgqFehy62af1HjBASY2uVC0OJ11a','ishanimadhushika377@gmail.com','admin',NULL,NULL,NULL,NULL,1,0,0,NULL,'2026-10-10 02:24:36.701894',NULL,NULL,0),
(2,NULL,'Player1','$bcrypt-sha256$v=2,t=2b,r=12$JU9rop/u1wju4HQxSZYcKO$vjqm34CPHn27aGBdXsx5akd.b9tgbtG','ishanimadhushika378@gmail.com','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-10-10 13:43:00.746584',NULL,NULL,0),
(3,NULL,'captain_user','$bcrypt-sha256$v=2,t=2b,r=12$4Dz0QAfnunPrThvCu.81oO$2vYPbvQ2x5zojQxZ2gKdVytxCjnHrLm','it24103403@my.sliit.lk','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-10-11 14:29:21.893616',NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-12  2:16:45
