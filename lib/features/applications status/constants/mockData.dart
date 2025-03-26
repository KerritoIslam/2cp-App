class ApplicationStatics {
  static final List<Map<String, dynamic>> applications = [
    {
      "id": "123",
      "proposal": "This is a proposal text",
      "post": {
        "id": "456",
        "title": "Software Engineer Intern",
        "description": "An internship position for software engineers.",
        "skills": ["Flutter", "Dart", "Firebase"],
        "company": {
          "id": "789",
          "name": "Tech Corp",
          "category": "CS",
          "profilepic": "https://shorturl.at/TZp1K"
        },
        "status": "opened",
        "duration": "3 months",
        "Type": "internship",
        "category": "EC",
      },
      "sumbittedAt": "2025-02-05T00:00:00Z",
      "type": "Full-time",
      "status": "Submitted"
    },
    {
      "id": "124",
      "proposal": "This is another proposal text",
      "post": {
        "id": "457",
        "title": "Finance Problem Solver",
        "description": "Solve challenging financial problems.",
        "skills": ["Excel", "Accounting", "Data Analysis"],
        "company": {
          "id": "790",
          "name": "Finance Inc",
          "category": "EC",
          "profilepic": "https://shorturl.at/TZp1K"
        },
        "category": "EC",
        "status": "opened",
        'Type': "Problem"
      },
      "category": "EC",
      "sumbittedAt": "2025-02-06T00:00:00Z",
      "type": "Part-time",
      "status": "Accepted"
    },
    {
      "id": "125",
      "proposal": "This is yet another proposal text",
      "post": {
        "id": "458",
        "title": "Healthcare Analyst",
        "description": "Analyze healthcare industry trends and data.",
        "skills": ["Research", "Data Science", "Python"],
        "company": {
          "id": "791",
          "name": "Health Solutions",
          "category": "EG",
          "profilepic": "https://shorturl.at/TZp1K"
        },
        "status": "closed",
        'Type': "internship",
        "category": "EC",
      },
      "sumbittedAt": "2025-02-07T00:00:00Z",
      "type": "Contract",
      "status": "In Review"
    }
  ];
}
