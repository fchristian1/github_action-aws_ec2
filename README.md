# GitHub Action AWS EC2

Dieses Repository demonstriert die Verwendung von GitHub Actions zur automatisierten Bereitstellung einer Website auf einer AWS EC2-Instanz unter Verwendung von Terraform und Ansible.

## Inhaltsverzeichnis

- [Überblick](#überblick)
- [Voraussetzungen](#voraussetzungen)
- [Verzeichnisstruktur](#verzeichnisstruktur)
- [Verwendung](#verwendung)
  - [1. Repository klonen](#1-repository-klonen)
  - [2. GitHub Secrets einrichten](#2-github-secrets-einrichten)
  - [3. Terraform-Konfiguration anpassen](#3-terraform-konfiguration-anpassen)
  - [4. Ansible-Playbook anpassen](#4-ansible-playbook-anpassen)
  - [5. GitHub Actions Workflow ausführen](#5-github-actions-workflow-ausführen)
- [Aufräumen](#aufräumen)
- [Lizenz](#lizenz)

## Überblick

Dieses Projekt automatisiert die Bereitstellung einer Website auf einer AWS EC2-Instanz mithilfe von GitHub Actions. Es nutzt Terraform zur Verwaltung der Infrastruktur und Ansible zur Konfiguration der bereitgestellten Instanz.

## Voraussetzungen

- Ein AWS-Konto mit Zugriffsschlüsseln.
- GitHub Secrets für `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` und`AWS_SESSION_TOKEN`.
- Grundlegende Kenntnisse in Terraform und Ansible.

## Verzeichnisstruktur

- `.github/workflows/`: Enthält die GitHub Actions Workflows.
- `ansible/`: Beinhaltet Ansible-Playbooks und -Rollen zur Konfiguration der EC2-Instanz.
- `terraform/`: Enthält Terraform-Konfigurationsdateien zur Bereitstellung der AWS-Ressourcen.
- `html/`: Statische HTML-Dateien für die Website.
- `react/`: Beispiel einer React-Anwendung.

## Verwendung

### 1. Repository klonen

Klonen Sie dieses Repository auf Ihren lokalen Rechner:

```bash
git clone https://github.com/fchristian1/github_action-aws_ec2.git
cd github_action-aws_ec2
```

### 2. GitHub Secrets einrichten

Fügen Sie in Ihrem GitHub-Repository die folgenden Secrets hinzu:

- `AWS_ACCESS_KEY_ID`: Ihr AWS Access Key ID.
- `AWS_SECRET_ACCESS_KEY`: Ihr AWS Secret Access Key.
- : Ihr AWS Session Token.

### 3. Terraform-Konfiguration anpassen

Passen Sie die Terraform-Konfigurationsdateien im `terraform/`-Verzeichnis an Ihre Anforderungen an, z.B. Region, Instanztyp oder Sicherheitsgruppen.

### 4. Ansible-Playbook anpassen

Bearbeiten Sie das Ansible-Playbook im `ansible/`-Verzeichnis, um die gewünschte Software auf der EC2-Instanz bereitzustellen und zu konfigurieren.

### 5. GitHub Actions Workflow ausführen

Pushen Sie Ihre Änderungen in das Repository. Der GitHub Actions Workflow im `.github/workflows/`-Verzeichnis wird automatisch ausgelöst und führt die folgenden Schritte aus:

1. **Terraform Apply**: Erstellt die EC2-Instanz und andere benötigte AWS-Ressourcen.
2. **Ansible Provisioning**: Konfiguriert die EC2-Instanz und stellt die Website bereit.

## Aufräumen

Um die erstellten AWS-Ressourcen zu entfernen und Kosten zu vermeiden, führen Sie den folgenden Befehl aus:

```bash
terraform destroy
```

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Siehe die [LICENSE](LICENSE)-Datei für weitere Details. 
