from django.contrib.auth.models import User
from django.db import models

from coa.models import Account


class JournalEntry(models.Model):
    entry_number = models.CharField(max_length=20, unique=True)
    date = models.DateField()
    description = models.TextField(blank=True)
    status = models.CharField(max_length=20)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.entry_number

class JournalLine(models.Model):
    entry = models.ForeignKey(JournalEntry, related_name='lines', on_delete=models.CASCADE)
    account = models.ForeignKey(Account, on_delete=models.CASCADE)
    debit = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    credit = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    reference = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return f"{self.entry.entry_number}: {self.account.code}"