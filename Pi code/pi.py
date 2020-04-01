import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
def addProducts(products):
    db = firestore.client()

    product_ref = db.collection(u'products2')
    for product in products:
        product_ref.add(product)

def getPurchases():
    print("Products Purchased but not delivered")
    print()

    db = firestore.client()
    purchases_ref = db.collection(u'purchased')
    docs = purchases_ref.stream()

    for purchase in docs:
        data = purchase.to_dict()
        if (data['delivered'] == False):
            doc_ref = db.collection(u'purchased').document(purchase.id)
            doc_watch = doc_ref.on_snapshot(on_snapshot)


def on_snapshot(doc_snapshot, changes, read_time):
    for doc in doc_snapshot:
        purchase = doc.to_dict()
        monitorMessage = True

        for item in purchase["items"]:

            if (doc.id in productsPurchased.keys()):
                productsPurchased[doc.id].append(item["qrCode"])
            else:
                productsPurchased[doc.id] = [item["qrCode"]]

            printPurchaseInfoOnScreen(monitorMessage, doc.id, item)
            monitorMessage = False

            if (purchase['delivered'] == True):
                print("Purchase {} has been delivered".format(doc.id))
                del productsPurchased[doc.id]

        print()

def printPurchaseInfoOnScreen(monitorMessage, purchaseId, item):
    if (monitorMessage):
        print(u'PurchaseId: {}'.format(purchaseId))
    print("Product Purchased QR Code = {}".format(item["qrCode"]))


def setDeliveredToTrue(purchaseId):
    db = firestore.client()
    purchases_ref = db.collection(u'purchased').document(purchaseId)
    purchases_ref.update({u'delivered' : True})

firebaseConfig = {
  "type": "service_account",
  "project_id": "delivery-drone-f337b",
  "private_key_id": "66ce74a57ec2f6279e421473883ae220d20559e2",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCE+V7MHJejz6sZ\nu/ISE8IjYeTQJT4F9ATEx5Ej3zcfBtnlchklzQFLbc7It7xvnJ34XS4IeG3eF7OP\nlglZQkOZWBs9dgciMPVjJVYEFm/vb+dv9TFQ9jRgHpbWXNfvTYfziof+ACAzDFh1\nJNhzP+2x89/aJ+LUMvRO9GPg/lzb/oqX7nvTBNkPWsMqCP4pCYmLxx2z9DlSLcKO\nw5D7D21ZP5uKAhDhhIgv5o1EFqeZV92IiRNgOoIvn08j1eUzL9QHMp6iv3rcWmYK\nh/nj/4pbXqsf+c22xVmgoILvVAIakRHB+rN6mnDdivaFVY7vS1HgbwEBLUToTuup\nyRhsu61BAgMBAAECggEAAeQqmCBZe0nZOwXYbu+jQZ3TM28uK0dB2JsmijIy7mDq\ncTge2bHpYG1kxSfQ2S0K9aT8oj/1PxUK96I4ipGV1MzjIUwIFLFJ0jHOIAOCLs+C\nhQ4BmC9SRiI1PsIGC7godHsuTTtq+dLlgLAIGJaKjs8DSm7qC97YKPXSpFj10Oaw\nCe+PwBQ+X586nBhc2q/vP8xGuLcmoBsoQpyTCEjdiI4U8wVCAcrUzabTS5nzmXoh\nMqODNd1gmID41m1206jqNAYhd4960czIsyFDjzHFYYXHYEDQGoIrjlBS/N2TRUKo\n15DyxGdcf80w9yw5J7vKI2wlGr+RWGKAXbpAL8yf+QKBgQC7ciL5mGlz5WxepbVe\nreUbTrae5PFte8uzRfgJu7jaZoFMDnmBKQZNrkIv44F1cWM4719bK57zUnZ7gxku\nZ/ETNID+mv5jqnse+mgMNGPf91rE9Dh2GxiC3VCyQGxWAf9ja6J1LhaPBmLBFqc8\nWYDYGt8sVg9sy+SgmWVC23bzSQKBgQC1mz7FyVGzishk6JQKTYHB5+ssUMeWCkgB\naOejtiYL++C+EPM3t/z7yjcJqofjqaBZRdrEbSjfMd4iKyRj0XYP+Il2GFDl9QuH\nfXEizmFRZRqwF5X8/b/6Ovw9zRBZtuJ3UA0bJq6vKKONY6S5G1mzsncSQHCWqAsy\nzGJY5qFyOQKBgQC04zQ1QYuiOCgYPjmEoLOTYqaBN9Z0HR86Za8zVWDSAlGMH/vJ\nVNmsZRmiNR5dQ4rJCtcumC3QCigkkSLf0ZanPeety8zqST5/ao62GGi5XW7O2g8S\niptgzkptehYR+eOHAfvIsS074KG0TDQe3RCle2ka1AIWr7x17xH1LuzfYQKBgDgk\n76osDCMqo7t2n9XzkksFTRJdQubi9NHiwcI+HNMVoqyABwFR01dwc8V8QBilJ1qS\nGwkhCkK+YwNDPTPS3OIhHzYwXEpLkK3pnSF6lmGYlUCdehRFyqUsuTDOBeEGhksG\np5aeReEG+lFK3fEQQJIqeV9eJrCc8SFaSIlde8oZAoGAHZ2fr5rOJtXyuALlpqDh\nO8HNJEhAfmO1WfcnPGuGu++28zI167lVzrUY95ycB06bXh0oVRzfabsux5DNfHta\nHNqTnEuos7reohZMt/M5IkXgqwzvV5LxFYTBRP259pDtRtMn3jIg191gC88oPJUE\nRCm8OK1SRApEU2VZrMB63PQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-pi7im@delivery-drone-f337b.iam.gserviceaccount.com",
  "client_id": "116241513961341048796",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-pi7im%40delivery-drone-f337b.iam.gserviceaccount.com"
}
cred = credentials.Certificate(firebaseConfig)
productsPurchased = {}
firebase_admin.initialize_app(cred)
getPurchases()