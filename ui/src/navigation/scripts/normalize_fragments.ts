function normalizeFragments (fragments, schemaMap) {
  const normalizeFragments = []

  for (let i = 0; i < fragments.length; i++) {
    const association = (
      schemaMap[fragments[i - 2]]?.associations?.find((assoc) => assoc.slug === fragments[i]) ||
      normalizeFragments[i - 2]?.schema?.associations?.find((assoc) => assoc.slug === fragments[i])
    )

    const schema = schemaMap[fragments[i]] || schemaMap[association?.schema_slug]

    const crumb = {
      fragment: fragments[i],
      association: association,
      schema: schema
    }

    normalizeFragments.push(crumb)
  }

  return normalizeFragments
}

export { normalizeFragments }
